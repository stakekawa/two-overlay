#define _XOPEN_SOURCE 500

#include <sys/types.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>
#include <errno.h>

#define BOLD			"\033[1m"
#define NORMAL			"\033[0m"

#define GREEN			"\033[0;32;1m"
#define YELLOW			"\033[0;33;1m"
#define RED			"\033[0;31;1m"

#define MSR_FIDVID_CONTROL	0xC0010041
#define MSR_FIDVID_STATUS	0xC0010042

#define CONTROL_STOP_GRANT_5NS	0x0000000100000000ULL
#define CONTROL_INIT_FID_VID	0x0000000000010000ULL

#define STATUS_PENDING		0x0000000080000000ULL
#define STATUS_MIN_VID		0x3f00000000000000ULL
#define STATUS_MAX_VID		0x003f000000000000ULL
#define STATUS_START_VID	0x00003f0000000000ULL
#define STATUS_CUR_VID		0x0000003f00000000ULL
#define STATUS_MAX_FID		0x00000000003f0000ULL
#define STATUS_START_FID	0x0000000000003f00ULL
#define STATUS_CUR_FID		0x000000000000003fULL

#define MHZ_FROM_FID(fid)	(800 + (fid) * 100)
#define MV_FROM_VID(vid)	(1550 - (vid) * 25)

#define FID_FROM_MHZ(mhz)	(((mhz) - 800) / 100)
#define VID_FROM_MV(mv)		((1550 - (mv)) / 25)

u_int64_t rdmsr(u_int32_t msr) {
  u_int64_t result;
  int fd;

  fd = open("/dev/cpu/0/msr", O_RDONLY);
  lseek(fd, msr, SEEK_SET);
  read(fd, &result, 8);
  close(fd);

  return result;
}

void wrmsr(u_int32_t msr, u_int64_t value) {
  int fd;

  fd = open("/dev/cpu/0/msr", O_WRONLY);
  lseek(fd, msr, SEEK_SET);
  write(fd, &value, 8);
  close(fd);
}

void print_and_set(int set_voltage, int mv) {
  u_int64_t status, control;
  u_int8_t min_vid, max_vid, cur_vid, start_vid, new_vid;
  u_int8_t cur_fid, max_fid, start_fid;
  int32_t new_vid_raw;

  status = rdmsr(MSR_FIDVID_STATUS);

  min_vid = (u_int8_t)((status & STATUS_MIN_VID) >> 56);
  max_vid = (u_int8_t)((status & STATUS_MAX_VID) >> 48);
  cur_vid = (u_int8_t)((status & STATUS_CUR_VID) >> 32);
  start_vid = (u_int8_t)((status & STATUS_START_VID) >> 40);

  max_fid = (u_int8_t)((status & STATUS_MAX_FID) >> 16);
  cur_fid = (u_int8_t)((status & STATUS_CUR_FID) >> 0);
  start_fid = (u_int8_t)((status & STATUS_START_FID) >> 8);

  printf(BOLD "Maximum freq.   :" NORMAL " 0x%02x (%i MHz)\n",
	 max_fid, MHZ_FROM_FID(max_fid));
  printf(BOLD "Startup freq.   :" NORMAL " 0x%02x (%i MHz)\n",
	 start_fid, MHZ_FROM_FID(start_fid));
  printf(BOLD "Current freq.   :" NORMAL " 0x%02x (%i MHz)\n",
	 cur_fid, MHZ_FROM_FID(cur_fid));

  printf("\n");

  printf(BOLD "Voltage range   : " NORMAL);
  if (min_vid == 0)
    printf("0x1e (800 mV) [No low limit]");
  else
    printf("0x%02x (%i mV)", min_vid, MV_FROM_VID(min_vid));
  printf(" -> ");
  if (max_vid == 0)
    printf("0x00 (1550 mV) [No high limit]");
  else
    printf("0x%02x (%i mV)", max_vid, MV_FROM_VID(max_vid));
  printf("\n");
  printf(BOLD "Startup voltage :" NORMAL " 0x%02x (%i mV)\n",
	 start_vid, MV_FROM_VID(start_vid));
  printf(BOLD "Current voltage :" NORMAL " 0x%02x (%i mV)\n",
	 cur_vid, MV_FROM_VID(cur_vid));

  if (set_voltage) {
    printf("\n");

    if (mv <= 0) {
      printf(RED "Hey! Try with a saner voltage!\n");
      exit(1);
    }

    new_vid_raw = VID_FROM_MV(mv);
    if (new_vid_raw & ~0x3f) {
      printf(RED "Hey! Your voltage doesn't give a correct VID!\n" NORMAL);
      exit(1);
    }

    new_vid = (u_int8_t)new_vid_raw;
    printf(BOLD "Target voltage  :" YELLOW " 0x%02x " NORMAL "("
	   YELLOW "%i mV" NORMAL ")\n",
	   new_vid, MV_FROM_VID(new_vid));

    control = CONTROL_STOP_GRANT_5NS |
              CONTROL_INIT_FID_VID |
              (new_vid << 8) |
              (cur_fid);
    printf(BOLD "New control MSR :" NORMAL " 0x%016lx\n", control);
    printf("\n");

    wrmsr(MSR_FIDVID_CONTROL, control);
    usleep(100);

    status = rdmsr(MSR_FIDVID_STATUS);
    cur_vid = (u_int8_t)((status & STATUS_CUR_VID) >> 32);

    printf(BOLD "New voltage     :" NORMAL " 0x%02x (%i mV) [%s]\n",
	   cur_vid, MV_FROM_VID(cur_vid),
	   ((cur_vid == new_vid) ? GREEN "SUCCESS" NORMAL :
	    RED "FAILURE" NORMAL));
  }
}


int main(int argc, char **argv) {
  int voltage = -1;

  if (argc == 2) {
    voltage = atoi(argv[1]);
    print_and_set(1, voltage);
  } else {
    print_and_set(0, 0);
  }

  return 0;
}
