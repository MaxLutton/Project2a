#include <getopt.h>
#include <time.h>
#include <string.h>
#include <errno.h>
#include <pthread.h>

void add(long long *pointer, long long value)
{
  long long sum = *pointer + value;
  *pointer = sum;
}

void* threadRoutine(void* arg)
{
  int its = *((int*)arg[0]);
  long long* count = ((long long*)arg[1]);
  int i = 0;
  for (i = 0; i < its; i++)
    add(&count, 1); 
  for (i = 0; i < its;i++)
    add(&count, -1);
  return NULL;
}

int main (int argc, char* argv[])
{
  int c;
  int numThreads=1;
  int numIts=1;
  char input;
  int errnum = 0;
  
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
  struct timespec time_init;
  struct timespec time_fin;
  clock_gettime(CLOCK_MONOTONIC, &time_init);
  int workPerThread = numIts / numThreads;
  int leftOver = numIts % numThreads;
  int i = 0;
  pthread_t* ids = (pthread_t*)malloc(sizeof(pthread_id)*numThreads);
  for (i = 0; i < numThreads; i++)
    {
      if (leftOver > 0)
	{
	  void arg[2];
	  arg[0] = workPerThread + 1;
	  arg[1] = &count; 
	  leftOver--;
	  pthread_create(ids[i], NULL, threadRoutine, arg);
	}
      else
	{
	  void irg[2];
	  irg[0] = workPerThread;
	  irg[1] = &count;
	  pthread_create(ids[i], NULL, threadRoutine, irg);
	}
    }
  for (i = 0; i < numThreads; i++)
    pthread_join(ids[i], NULL);
  clock_gettime(CLOCK_MONOTONIC, &time_fin);
  int totalOps = 2 * numThreads * numIts;
  long runtime = time_fin.tv_nsec - time_init.tv_nsec;
  long avg = runtime / totalOps;
  
  printf("add-none,%d,%d,%d,%d,%d,%d",numThreads, numIts, totalOps, runtime, avg, count );
  strerr(errnum);
  if (errnum)
    exit(errnum);
  else
    exit(0);
	  
}
