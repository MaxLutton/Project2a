#include <getopt.h>
#include <time.h>
#include <string.h>
#include <errno.h>
#include <pthread.h>
#include <stdlib.h>
#include <stdio.h>
#include <sched.h>

int opt_yield = 0;
int mutex = 0;
int spin = 0;
pthread_mutex_t lock;
int otherLock;
//use this struct to pass argument to thread routines
struct argument
{
  long long* countPtr;
  int howMuch;
};

void add(long long *pointer, long long value)
{
  if (spin)
    while(__sync_lock_test_and_set(&otherLock, 1));
  if (mutex)
    pthread_mutex_lock(&lock);
  long long sum = *pointer + value;
  if (opt_yield)
    sched_yield();
   *pointer = sum;
  if (mutex)
    pthread_mutex_unlock(&lock);
  if(spin)
    __sync_lock_release(&otherLock, 0);
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
  char* testName = malloc(sizeof(char)*20);//more than enough
  strcat(testName, "add");
  char str;
  while(1)
    {
      static struct option long_options[] =
	{
	  {"threads", required_argument, 0, 'a'},
	  {"iterations", required_argument, 0, 'b'},
	  {"yield", no_argument, 0, 'c'},
	  {"sync", required_argument, 0, 'd'},
	  {0,0, 0, 0}
	};
      int option_index = 0;
      c = getopt_long(argc, argv,"a:b:cd:", long_options, &option_index);

      if (c == -1)
	break;
      switch (c)
	{
	case 'a':
	  numThreads  = atoi((strdup(optarg)));
	  break;
	case 'b':
	   numIts  = atoi(strdup(optarg));
	  break;
	case 'c':
	  opt_yield = 1;
	  break;
	case 'd':
	   str  = *(strdup(optarg));
	  if(str  == 'm')
	    mutex = 1;
	  if (str  == 's')
	    spin = 1;
	  break;
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

  if (mutex)
    {
      if(pthread_mutex_init(&lock, NULL) !=0)
	perror("mutex failed");
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

  //configure output string
  if (opt_yield)
    strcat(testName, "-yield");
  if (mutex)
    strcat(testName, "-m");
  if (spin)
    strcat(testName, "-s");
  if (!spin & !mutex & !opt_yield)
    strcat(testName, "-none");
    printf("%s,%d,%d,%d,%d,%d,%d",testName,numThreads, numIts, totalOps, runtime, avg, count );
    /*else if (opt_yield)
      printf("add-yield,%d,%d,%d,%d,%d,%d",numThreads, numIts, totalOps, runtime, avg, count);*/
  //memory management
  for (i = 0; i < numThreads; i++)
    free(args[i]);
  free(args);
  free(ids);
  free(testName);
 pthread_mutex_destroy(&lock);
  
  strerror(errnum);
  if (errnum)
    exit(errnum);
  else
    exit(0);
	  
}
