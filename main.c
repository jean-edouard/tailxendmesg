#include <xenctrl.h>
#include <stdio.h>
#include <unistd.h>

int main()
{
  xc_interface *xch;
  char buf[1024];
  unsigned int size;
  uint32_t index = 0;

  xch = xc_interface_open(NULL, NULL, XC_OPENFLAG_NON_REENTRANT);
  while (1)
    {
      size = 1023;
      xc_readconsolering(xch, buf, &size, 0, 1, &index);
      if (size != 0) {
	buf[size] = '\0';
	printf(buf);
      } else {
	/* The call to xc_readconsolering() is non-blocking, so we
	   sleep for 100ms when the last call didn't return anything */
      	usleep(100000);
      }
    }

  return 0;
}
