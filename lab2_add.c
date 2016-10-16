#include <getopt.h>
#include <time.h>
#include <string.h>

void add(long long *pointer, long long value)
{
  long long sum = *pointer + value;
  *pointer = sum;
}


int main (int argc, char* argv[])
{
  int c;
  int numThreads=1;
  int numIts=1;
  char input;
  while(1)
    {
      static struct option long_options[] =
	{
	  {"threads", required_argument, 0, 'a'},
	  {"iterations", required_argument, 0, 'b'},
	  {0,0, 0, 0}
	};
      int option_index = 0;
      c = getopt_long(argc, argv,"a:b:", long_options, &option_index);

      if (c == -1)
	break;
      switch (c)
	{
	case 'a':
	  numThreads  = atoi(strdup(optarg));
	  break;
	case 'b':
	  numIts = atoi(strdup(optarg));
	  break;
	}
    }
  long long count = 0;


}
