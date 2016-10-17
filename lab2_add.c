#include <getopt.h>
#include <time.h>
#include <string.h>
#include <errno.h>
#include <pthread.h>
#include <stdlib.h>
#include <stdio.h>
#include <sched.h>

int opt_yield = 0;
//use this struct to pass argument to thread routines
struct argument
{
  long long* countPtr;
  int howMuch;
};

void add(long long *pointer, long long value)
{
  long long sum = *pointer + value;
  if (opt_yield)
    sched_yield();
  *pointer = sum;
}

void* threadRoutine(void* arg)
{
  struct argument* um= (struct argument*)arg;
  int i = 0;
  long long* c = um->countPtr;
  int its = um->howMuch;
  for (i = 0; i < its; i++)
    add(c, 1); 
  for (i = 0; i < its;i++)
    add(c, -1);
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
	  {"yield", no_argument, 0, 'c'},
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
	case 'c':
	  opt_yield = 1;
	}
    }
  long long count = 0;
  struct timespec time_init;
  struct timespec time_fin;

  
  int workPerThread = numIts / numThreads;
  int leftOver = numIts % numThreads;
  int i = 0;
  pthread_t* ids = malloc(sizeof(pthread_t)*numThreads);
  struct argument** args = malloc(sizeof(struct argument*)*numThreads);
  
  //initialize arguments for string routins
  for (i = 0; i < numThreads; i++)
    {
      if (leftOver > 0)
	{
	  args[i] = malloc(sizeof(struct argument));
	  args[i]->countPtr = &count;
	  args[i]->howMuch  = workPerThread + 1;
	  leftOver--;
	}
      else
	{
	  args[i] = malloc(sizeof(struct argument));
	  args[i]->countPtr = &count;
	  args[i]->howMuch = workPerThread;
	}
    }
  //get initial time right before creating threads
  clock_gettime(CLOCK_MONOTONIC, &time_init);
  for (i = 0; i < numThreads; i++)
    pthread_create(ids + i, NULL, threadRoutine, (void*)args[i]);
  for (i = 0; i < numThreads; i++)
    pthread_join((ids[i]), NULL);
  //finish time right after closing threads
  clock_gettime(CLOCK_MONOTONIC, &time_fin);
  int totalOps = 2 * numThreads * numIts;
  long runtime = time_fin.tv_nsec - time_init.tv_nsec;
  long avg = runtime / totalOps;

  if (!opt_yield)
    printf("add-none,%d,%d,%d,%d,%d,%d",numThreads, numIts, totalOps, runtime, avg, count );
  else if (opt_yield)
    printf("add-yield,%d,%d,%d,%d,%d,%d",numThreads, numIts, totalOps, runtime, avg, count);
  //memory management
  for (i = 0; i < numThreads; i++)
    free(args[i]);
  free(args);
  free(ids);
  strerror(errnum);
  if (errnum)
    exit(errnum);
  else
    exit(0);
	  
}
