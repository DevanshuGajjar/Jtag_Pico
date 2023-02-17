#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <sys/socket.h>
#include <sys/types.h>
#define BUFFER_SIZE         2048

#include <libusb-1.0/libusb.h>

#define DIRTYJTAG_VID       0x1209
#define DIRTYJTAG_PID       0xC0CA
#define DIRTYJTAG_INTF      0
#define DIRTYJTAG_READ_EP   0x82
#define DIRTYJTAG_WRITE_EP  0x01
 
#define DIRTYJTAG_TIMEOUT     1000

libusb_context *usb_ctx;
libusb_device_handle *dev_handle;

static char xvcInfo[64];

// Note: Modified!
enum dirtyJtagCmd {
	CMD_STOP =  0x00,
	CMD_INFO =  0x01,
	CMD_FREQ =  0x02,
	CMD_XFER =  0x03,
	CMD_IDCODE = 0x04,
	CMD_GETSIG = 0x05,
	CMD_CLK =    0x06
};

int device_init()
{
  int ret;
  int var_usb = libusb_init(&usb_ctx);
  //printf("-> USB INIT %d\n",var_usb);
  if (var_usb < 0) {
    printf("[ERROR] libusb init failed!\n");
    return -1;
  }
  dev_handle = libusb_open_device_with_vid_pid(usb_ctx, DIRTYJTAG_VID, DIRTYJTAG_PID);
  if (!dev_handle) {
    printf("[ERROR] failed to open usb device!\n");
    libusb_exit(usb_ctx);
    return -1;
  }
  ret = libusb_claim_interface(dev_handle, DIRTYJTAG_INTF);
  if (ret) {
    printf("[!] libusb error while claiming DirtyJTAG interface\n");
    libusb_close(dev_handle);
    libusb_exit(usb_ctx);
    return -1;
  }

  return 0; // success
}

void device_close()
{
  if (dev_handle)
    libusb_close(dev_handle);
  if (usb_ctx)
    libusb_exit(usb_ctx);
}

int main(){
  int i;
  int s;
  uint8_t rx_buf[64];
  struct sockaddr_in address;
    if (device_init() != 0) {
        printf("USB Initialization Falied");
        return -1;
    }
  printf("Daemon is listening now!\n");

	int ret;
  int actual_length;
  uint8_t buf[1] = {CMD_IDCODE};
  //uint8_t buf[] = {CMD_INFO,
				//CMD_STOP};
  printf("Going to Bulk Transfer\n");
  ret = libusb_bulk_transfer(dev_handle, DIRTYJTAG_WRITE_EP,
			        buf, 2, &actual_length, DIRTYJTAG_TIMEOUT);
  if(ret < 0){
      printf("Bulk Treansfer Failed with value %d\n",ret);
    }

  printf("Waiting for data to receive\n");
  ret = libusb_bulk_transfer(dev_handle, DIRTYJTAG_READ_EP,
						rx_buf, 64, &actual_length, DIRTYJTAG_TIMEOUT);

  printf("Data Received %s\n",rx_buf);
  return 0;

}





