This distribution contains 4  source files:
     lab2_add.c: is a program that implements and tests a shared variable add function, using various techniques to secure critical sections
     SortedList.h: header file with function prototypes, provided by the professor
     SortedList.c: implementation of those basic linked list functions
     lab2_list.c: program that, like add.c, implements and tests a shared variable procedure, however this is for a linked list, which is much more intensive.

For both lab2_add.c and lab2_list.c, in order to get accurate readings from clock_gettime (I was getting negatives for large values), I borrowed some code from the following website: www.guyrutenberg.com/2007/09/22/profiling-code-using-clock_gettime/ This was a good supplemental resource for understanding how clock_gettime works and how to use it properly.

This distribution contains a Makefile with 5 targets:
     build: is the default. It compiles the source files to produce 2 executables, lab2_list and lab2_add
     tests: this runs a large number of tests and puts the output into CSVs, one for lab2_list and one for lab2_add
     graphs: this runs gnuplot with the provided .gp scripts
     tarball: this creates this distribution
     clean: this deletes the executables
There are 9 .png image files, 5 containing results from the tests run on lab2_add and 4 for lab2_list


QUESTION 2.1.1 - causing conflicts:

Both of these occurances are due to the nature of what causes the failures. Theprogram fails when threads write to the counter in between each other's reads, so the resulting value is incorrect. The more iterations each thread has, the greater the likelihood of the conflict occurring. The significantly smaller number of iterations seldom fail because there is simply less opportunity for the race conditions to take affect.

QUESTION 2.1.2 - cost of yielding:

The yields go much slower because they are causing excess context switches. This additional time goes to the overhead involved in context switches--loading stack frames, setting registers, etc. It is possible to get valid per-operation timings while using the yield option. You just have to increase the number of iterations significantly, thus diminishing the percentage of time made up by context switches.

QUESTION 2.1.3 - measurement errors:

The average cost per operation drops with increasing iterations because the time ratio of actual computation time to start-up costs is increasing. If the costs per iteration is a funciton of the number of iterations, the cost/instruction will eventually converge on its lower limit. After a certain number of iterations, the cost per iteration will stop decreasing.

QUESTION 2.1.4 - costs of serialization

All of the operations perform similarly for low numbers of threads because there are relatively fewer opportunites for the race conditions to take effect--the threads aren't writing to the counter at the same time. My data actually did not show the 3 protected operations slowing down as the number of threads rose. Only the spin increased in cost. Spin definitely increased in cost because because, with more threads, they spent increasing amounts of time spinning, doing no work when another could have done work.

QUESTION 2.2.1 - scalability of Mutex

In part 1, there was a great deal of variation in time per protected operation. In part 2, however, the cost per protected operation stayed fairly constant. The only reason for this that I could think of is that, in part 2, the critical sections contained much more code and more operations than in part 1. Perhaps this acted to stabilize the cost, as the threads' wait time did not considerably incease or decrease, proportionately.

QUESTION 2.2.2 - scalability of spin locks

For spin locks, the cost per operation seems to steadily climb as number of threads increases, though this is at a fairly slow rate. For mutexes, on the other hand, the cost seems to stay consistent for all numbers of threads. Both techniques start with the same cost, however, with spin's slight increase causing the performance gap. This may be caused by the nature of spin-locks, since they will spin more and more. Also they're slow.
