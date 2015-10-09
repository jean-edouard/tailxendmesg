#include <xenctrl.h>
#include <stdio.h>
#include <unistd.h>

int main()
{
  xc_interface *xch;
  char buf[1024];
  unsigned int size;
  uint32_t index = 0;
  int fast = 1000;

  xch = xc_interface_open(NULL, NULL, XC_OPENFLAG_NON_REENTRANT);
  while (1)
    {
      size = 1023;
      xc_readconsolering(xch, buf, &size, 0, 1, &index);
      buf[size] = '\0';
      printf(buf);
      /* Be fast at the beginning, we don't want to stare at the
	 screen for 2 minutes while all the old logs arrive */
      /* if (fast > 0) */
      /* 	fast--; */
      /* else */
      /* 	usleep(100000); */
    }

  return 0;
}
