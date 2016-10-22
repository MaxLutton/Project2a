#include "SortedList.h"
#include <pthread.h>
#include <getopt.h>
#include <string.h>
#include <time.h>
#include <stdlib.h>
#include <sched.h>
#include <stdio.h>
#include <errno.h>
/*
int opt_yield = 0;
int INSERT_YIELD = 0;
int DELETE_YIELD = 0;
int LOOKUP_YIELD = 0;*/
int opt_yield = 0;
char* values;
SortedList_t* head;
 
struct argument
{
  int begin;
  int end;
  int work;
};

void* threadRoutine(void* arg)
{
  struct argument* um = (struct argument*)arg;
  int begin = um->begin;
  int end = um->end;
  int n = um->work;

  SortedListElement_t** elements = malloc(sizeof(SortedListElement_t*)*n); 
  int i = 0;
  //insert elements into list
  for (i = 0; i < n; i++)
    {
       elements[i] = malloc(sizeof(SortedListElement_t));
      elements[i]->key = &(values[begin+i]);
      SortedList_insert(head, elements[i]);
    }
  //get length for some reason
  int len = SortedList_length(head);
  //find and delete what we created
  for (i = 0; i < n; i++)
    {
      SortedListElement_t* temp = SortedList_lookup(head, &(values[begin+i]));
      SortedList_delete(temp);
      free(temp);
    }
  free(elements);
  return NULL;
}

int main(int argc, char* argv[])
{
  int c;
  int numThreads=1;
  int numIts=1;
  int errnum=0;
  char* testName = malloc(sizeof(char)*20);//more than enough
  strcat(testName, "list-");
  while(1)
    {
      static struct option long_options[] =
	{
	  {"threads", required_argument, 0, 'a'},
	  {"iterations", required_argument, 0, 'b'},
	  {"yield", required_argument, 0, 'c'},
	  {0,0,0,0}
	};
      int option_index=0;
      c = getopt_long(argc, argv, "a:b:c:", long_options, &option_index);

      if (c == -1)
	break;
      switch(c)
	{
	case 'a':
	  numThreads = atoi((strdup(optarg)));
	  break;
	case 'b':
	  numIts = atoi(strdup(optarg));
	  break;
	case 'c':
	  //set flags
	  opt_yield = 1;
	  int n = strlen(strdup(optarg));
	  char* str = malloc(sizeof(char)*n);
	  str = strdup(optarg);
	  int j =0;
	  for(j = 0; j < n; j++)
	    {
	      if (str[j] == 'i')
		INSERT_YIELD;
	      else if (str[j] == 'd')
		DELETE_YIELD;
	      else if (str[j] == 'l')
		LOOKUP_YIELD;
	    }
	  free(str);
	  break;
	}
    }
  //initializing values and list
  int numValues = numIts * numThreads;
  values = malloc(sizeof(char)*numValues);
  int j = 0;
  for(j = 0; j < numValues; j++)
    {
      srand(time(NULL)+j*j);
      values[j] = rand();
    }

  head = malloc(sizeof(SortedList_t));

  int workPerThread = numValues / numThreads;
  int leftOver = numValues % numThreads;
  int i = 0;
  pthread_t* ids = malloc(sizeof(pthread_t)*numThreads);
  struct argument** args = malloc(sizeof(struct argument*)*numThreads);

  int elementCount =0;
  
  for (i = 0; i < numThreads; i++)
    {
      if (leftOver > 0)
	{
	  args[i] = malloc(sizeof(struct argument));
	  args[i]->begin = elementCount;
	  elementCount = elementCount + workPerThread + 1;
	  args[i]->end = elementCount - 1;
	  args[i]->work = workPerThread + 1;
	  leftOver--;
	}
      else
	{
	  args[i] = malloc(sizeof(struct argument));
	  args[i]->begin = elementCount;
	  elementCount = elementCount + workPerThread;
	  args[i]->end = elementCount - 1;
	  args[i]->work = workPerThread;
	}
    }
  struct timespec time_init;
  struct timespec time_fin;

  //get initial time right before creating threads
  clock_gettime(CLOCK_MONOTONIC, &time_init);
  for (i = 0; i < numThreads; i++)
    pthread_create(ids + i, NULL, threadRoutine, (void*)args[i]);
  for (i = 0; i < numThreads; i++)
    pthread_join(ids[i], NULL);
  clock_gettime(CLOCK_MONOTONIC, &time_fin);
  int totalOps = 3 * numThreads * numIts;
  long runtime = time_fin.tv_nsec - time_init.tv_nsec;
  long avg = runtime / totalOps;

  //configure output string
  if (INSERT_YIELD)
    strcat(testName, "i");
  if (DELETE_YIELD)
    strcat(testName, "d");
  if (LOOKUP_YIELD)
    strcat(testName, "l");
  if (!opt_yield)
    strcat(testName, "none");
  strcat(testName, "-");
  strcat(testName, "none");

  strerror(errnum);
  if (errnum)
    exit(errnum);
  else
    exit(0);
}
	  
