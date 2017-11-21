#include<stdio.h>
#include"api_v4l2.h"

int main(void)
{
	int ret = linux_v4l2_device_init();
	ret = linux_v4l2_start_capturing();
	FreamBuffer framebf;
	linux_v4l2_get_fream(&framebf);
	linux_v4l2_stop_capturing();
	linux_v4l2_device_uinit();
	return 0;
}
