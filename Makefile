build:
	gcc -g -lpthread -lrt -o lab2_add lab2_add.c
	gcc -g -lpthread -lrt -o lab2_list lab2_list.c SortedList.c

graphs:
	./gnuplot lab2_list.gp
	./gnuplot lab2_add.gp
tarball:
	tar -czf lab2a-604493477.tar.gz lab2_add.c lab2_list.c SortedList.h SortedList.c Makefile lab2_add.csv lab2_list.csv lab2_add-1.png lab2_add-2.png lab2_add-3.png lab2_add-4.png lab2_add-5.png lab2_list-1.png lab2_list-2.png lab2_list-3.png lab2_list-4.png README.txt
clean:
	rm -f lab2_list
	rm -f lab2_add
tests:
#none
	rm -f lab2_add.csv
	./lab2_add --threads=1 --iterations=100 >>lab2_add.csv
	./lab2_add --threads=1 --iterations=1000 >>lab2_add.csv
	./lab2_add --thread=1 --iterations=10000 >>lab2_add.csv
	./lab2_add --threads=1 --iterations=100000 >>lab2_add.csv
	./lab2_add --threads=2 --iterations=100 >>lab2_add.csv
	./lab2_add --threads=2 --iterations=1000 >>lab2_add.csv
	./lab2_add --thread=2 --iterations=10000 >>lab2_add.csv
	./lab2_add --threads=2 --iterations=100000 >>lab2_add.csv
	./lab2_add --threads=4 --iterations=100 >>lab2_add.csv
	./lab2_add --threads=4 --iterations=1000 >>lab2_add.csv
	./lab2_add --threads=4 --iterations=10000 >>lab2_add.csv
	./lab2_add --threads=4 --iterations=100000 >>lab2_add.csv
	./lab2_add --threads=8 --iterations=100 >>lab2_add.csv
	./lab2_add --threads=8 --iterations=1000 >>lab2_add.csv
	./lab2_add --threads=8 --iterations=10000 >>lab2_add.csv
	./lab2_add --threads=8 --iterations=100000 >>lab2_add.csv
	./lab2_add --threads=12 --iterations=100 >>lab2_add.csv
	./lab2_add --threads=12 --iterations=1000 >>lab2_add.csv
	./lab2_add --threads=12 --iterations=10000 >>lab2_add.csv
	./lab2_add --threads=12 --iterations=100000 >>lab2_add.csv
#yield
	./lab2_add --threads=1 --iterations=10 --yield >>lab2_add.csv
	./lab2_add --threads=1 --iterations=20 --yield >>lab2_add.csv
	./lab2_add --threads=1 --iterations=40 --yield >>lab2_add.csv
	./lab2_add --threads=1 --iterations=80 --yield >>lab2_add.csv
	./lab2_add --threads=1 --iterations=100 --yield >>lab2_add.csv
	./lab2_add --threads=1 --iterations=1000 --yield >>lab2_add.csv
	./lab2_add --thread=1 --iterations=10000 --yield >>lab2_add.csv
	./lab2_add --threads=1 --iterations=100000 --yield >>lab2_add.csv
	./lab2_add --threads=2 --iterations=10 --yield >>lab2_add.csv
	./lab2_add --threads=2 --iterations=20 --yield >>lab2_add.csv
	./lab2_add --threads=2 --iterations=40 --yield >>lab2_add.csv
	./lab2_add --threads=2 --iterations=80 --yield >>lab2_add.csv
	./lab2_add --threads=2 --iterations=100 --yield >>lab2_add.csv
	./lab2_add --threads=2 --iterations=1000 --yield >>lab2_add.csv
	./lab2_add --thread=2 --iterations=10000 --yield >>lab2_add.csv
	./lab2_add --threads=2 --iterations=100000 --yield >>lab2_add.csv
	./lab2_add --threads=4 --iterations=10 --yield >>lab2_add.csv
	./lab2_add --threads=4 --iterations=20 --yield >>lab2_add.csv
	./lab2_add --threads=4 --iterations=40 --yield >>lab2_add.csv
	./lab2_add --threads=4 --iterations=80 --yield >>lab2_add.csv
	./lab2_add --threads=4 --iterations=100 --yield >>lab2_add.csv
	./lab2_add --threads=4 --iterations=1000 --yield >>lab2_add.csv
	./lab2_add --threads=4 --iterations=10000 --yield >>lab2_add.csv
	./lab2_add --threads=4 --iterations=100000 --yield >>lab2_add.csv
	./lab2_add --threads=8 --iterations=10 --yield >>lab2_add.csv
	./lab2_add --threads=8 --iterations=20 --yield >>lab2_add.csv
	./lab2_add --threads=8 --iterations=40 --yield >>lab2_add.csv
	./lab2_add --threads=8 --iterations=80 --yield >>lab2_add.csv
	./lab2_add --threads=8 --iterations=100 --yield >>lab2_add.csv
	./lab2_add --threads=8 --iterations=1000 --yield >>lab2_add.csv
	./lab2_add --threads=8 --iterations=10000 --yield >>lab2_add.csv
	./lab2_add --threads=8 --iterations=100000 --yield >>lab2_add.csv
	./lab2_add --threads=12 --iterations=10 --yield >>lab2_add.csv
	./lab2_add --threads=12 --iterations=20 --yield >>lab2_add.csv
	./lab2_add --threads=12 --iterations=40 --yield >>lab2_add.csv
	./lab2_add --threads=12 --iterations=80 --yield >>lab2_add.csv
	./lab2_add --threads=12 --iterations=100 --yield >>lab2_add.csv
	./lab2_add --threads=12 --iterations=1000 --yield >>lab2_add.csv
	./lab2_add --threads=12 --iterations=10000 --yield >>lab2_add.csv
	./lab2_add --threads=12 --iterations=100000 --yield >>lab2_add.csv
#mutex with yield
	./lab2_add --threads=1 --iterations=10000 --yield --sync=m >>lab2_add.csv
	./lab2_add --threads=2 --iterations=10000 --yield --sync=m >>lab2_add.csv
	./lab2_add --threads=4 --iterations=10000 --yield --sync=m >>lab2_add.csv
	./lab2_add --threads=8 --iterations=10000 --yield --sync=m >>lab2_add.csv
	./lab2_add --threads=12 --iterations=10000 --yield --sync=m >>lab2_add.csv
#spin with yield
	./lab2_add --threads=1 --iterations=1000 --yield --sync=s >>lab2_add.csv
	./lab2_add --threads=2 --iterations=1000 --yield --sync=s >>lab2_add.csv
	./lab2_add --threads=4 --iterations=1000 --yield --sync=s >>lab2_add.csv
	./lab2_add --threads=8 --iterations=1000 --yield --sync=s >>lab2_add.csv
	./lab2_add --threads=12 --iterations=1000 --yield --sync=s >>lab2_add.csv
#CAS with yield
	./lab2_add --threads=1 --iterations=10000 --yield --sync=c >>lab2_add.csv
	./lab2_add --threads=2 --iterations=10000 --yield --sync=c >>lab2_add.csv
	./lab2_add --threads=4 --iterations=10000 --yield --sync=c >>lab2_add.csv
	./lab2_add --threads=8 --iterations=10000 --yield --sync=c >>lab2_add.csv
	./lab2_add --threads=12 --iterations=10000 --yield --sync=c >>lab2_add.csv

#just mutex
	./lab2_add --thread=1 --iterations=10000 --sync=m >>lab2_add.csv
	./lab2_add --thread=2 --iterations=10000 --sync=m >>lab2_add.csv
	./lab2_add --thread=4 --iterations=10000 --sync=m >>lab2_add.csv
	./lab2_add --thread=8 --iterations=10000 --sync=m >>lab2_add.csv
	./lab2_add --thread=12 --iterations=10000 --sync=m >>lab2_add.csv
#just spin
	./lab2_add --thread=1 --iterations=1000 --sync=s >>lab2_add.csv
	./lab2_add --thread=2 --iterations=1000 --sync=s >>lab2_add.csv
	./lab2_add --thread=4 --iterations=1000 --sync=s >>lab2_add.csv
	./lab2_add --thread=8 --iterations=1000 --sync=s >>lab2_add.csv
	./lab2_add --thread=12 --iterations=10000 --sync=s >>lab2_add.csv
#just CAS
	./lab2_add --thread=1 --iterations=10000 --sync=c >>lab2_add.csv
	./lab2_add --thread=2 --iterations=10000 --sync=c >>lab2_add.csv
	./lab2_add --thread=4 --iterations=10000 --sync=c >>lab2_add.csv
	./lab2_add --thread=8 --iterations=10000 --sync=c >>lab2_add.csv
	./lab2_add --thread=12 --iterations=10000 --sync=c >>lab2_add.csv

	rm -f lab2_list.csv
#1 thread
	-./lab2_list --iterations=10 >>lab2_list.csv
	-./lab2_list --iterations=100 >>lab2_list.csv
	-./lab2_list --iterations=1000 >>lab2_list.csv
	-./lab2_list --iterations=10000 >>lab2_list.csv
	-./lab2_list --iterations=20000 >>lab2_list.csv
#more threads w/ no yields
	-./lab2_list --threads=2 --iterations=10 >>lab2_list.csv
	-./lab2_list --threads=2 --iterations=100 >>lab2_list.csv
	-./lab2_list --threads=2 --iterations=1000 >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=10 >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=100 >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=1000 >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=10 >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=100 >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=1000 >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=10 >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=100 >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=1000 >>lab2_list.csv
#yield combinations
	-./lab2_list --yield=i --threads=2 --iterations=2 >>lab2_list.csv
	-./lab2_list --yield=i --threads=2 --iterations=4 >>lab2_list.csv
	-./lab2_list --yield=i --threads=2 --iterations=8 >>lab2_list.csv
	-./lab2_list --yield=i --threads=2 --iterations=16 >>lab2_list.csv
	-./lab2_list --yield=i --threads=2 --iterations=32 >>lab2_list.csv
	-./lab2_list --yield=d --threads=2 --iterations=2 >>lab2_list.csv
	-./lab2_list --yield=d --threads=2 --iterations=4 >>lab2_list.csv
	-./lab2_list --yield=d --threads=2 --iterations=8 >>lab2_list.csv
	-./lab2_list --yield=d --threads=2 --iterations=16 >>lab2_list.csv
	-./lab2_list --yield=d --threads=2 --iterations=32 >>lab2_list.csv
	-./lab2_list --yield=id --threads=2 --iterations=2 >>lab2_list.csv
	-./lab2_list --yield=id --threads=2 --iterations=4 >>lab2_list.csv
	-./lab2_list --yield=id --threads=2 --iterations=8 >>lab2_list.csv
	-./lab2_list --yield=id --threads=2 --iterations=16 >>lab2_list.csv
	-./lab2_list --yield=id --threads=2 --iterations=32 >>lab2_list.csv
	-./lab2_list --yield=li --threads=2 --iterations=2 >>lab2_list.csv
	-./lab2_list --yield=li --threads=2 --iterations=4 >>lab2_list.csv
	-./lab2_list --yield=li --threads=2 --iterations=8 >>lab2_list.csv
	-./lab2_list --yield=li --threads=2 --iterations=16 >>lab2_list.csv
	-./lab2_list --yield=li --threads=2 --iterations=32 >>lab2_list.csv
	-./lab2_list --yield=dl --threads=2 --iterations=2 >>lab2_list.csv
	-./lab2_list --yield=dl --threads=2 --iterations=4 >>lab2_list.csv
	-./lab2_list --yield=dl --threads=2 --iterations=8 >>lab2_list.csv
	-./lab2_list --yield=dl --threads=2 --iterations=16 >>lab2_list.csv
	-./lab2_list --yield=dl --threads=2 --iterations=32 >>lab2_list.csv

	-./lab2_list --yield=i --threads=4 --iterations=2 >>lab2_list.csv
	-./lab2_list --yield=i --threads=4 --iterations=4 >>lab2_list.csv
	-./lab2_list --yield=i --threads=4 --iterations=8 >>lab2_list.csv
	-./lab2_list --yield=i --threads=4 --iterations=16 >>lab2_list.csv
	-./lab2_list --yield=i --threads=4 --iterations=32 >>lab2_list.csv
	-./lab2_list --yield=d --threads=4 --iterations=2 >>lab2_list.csv
	-./lab2_list --yield=d --threads=4 --iterations=4 >>lab2_list.csv
	-./lab2_list --yield=d --threads=4 --iterations=8 >>lab2_list.csv
	-./lab2_list --yield=d --threads=4 --iterations=16 >>lab2_list.csv
	-./lab2_list --yield=d --threads=4 --iterations=32 >>lab2_list.csv
	-./lab2_list --yield=id --threads=4 --iterations=2 >>lab2_list.csv
	-./lab2_list --yield=id --threads=4 --iterations=4 >>lab2_list.csv
	-./lab2_list --yield=id --threads=4 --iterations=8 >>lab2_list.csv
	-./lab2_list --yield=id --threads=4 --iterations=16 >>lab2_list.csv
	-./lab2_list --yield=id --threads=4 --iterations=32 >>lab2_list.csv
	-./lab2_list --yield=li --threads=4 --iterations=2 >>lab2_list.csv
	-./lab2_list --yield=li --threads=4 --iterations=4 >>lab2_list.csv
	-./lab2_list --yield=li --threads=4 --iterations=8 >>lab2_list.csv
	-./lab2_list --yield=li --threads=4 --iterations=16 >>lab2_list.csv
	-./lab2_list --yield=li --threads=4 --iterations=32 >>lab2_list.csv
	-./lab2_list --yield=dl --threads=4 --iterations=2 >>lab2_list.csv
	-./lab2_list --yield=dl --threads=4 --iterations=4 >>lab2_list.csv
	-./lab2_list --yield=dl --threads=4 --iterations=8 >>lab2_list.csv
	-./lab2_list --yield=dl --threads=4 --iterations=16 >>lab2_list.csv
	-./lab2_list --yield=dl --threads=4 --iterations=32 >>lab2_list.csv

	-./lab2_list --yield=i --threads=8 --iterations=2 >>lab2_list.csv
	-./lab2_list --yield=i --threads=8 --iterations=4 >>lab2_list.csv
	-./lab2_list --yield=i --threads=8 --iterations=8 >>lab2_list.csv
	-./lab2_list --yield=i --threads=8 --iterations=16 >>lab2_list.csv
	-./lab2_list --yield=i --threads=8 --iterations=32 >>lab2_list.csv
	-./lab2_list --yield=d --threads=8 --iterations=2 >>lab2_list.csv
	-./lab2_list --yield=d --threads=8 --iterations=4 >>lab2_list.csv
	-./lab2_list --yield=d --threads=8 --iterations=8 >>lab2_list.csv
	-./lab2_list --yield=d --threads=8 --iterations=16 >>lab2_list.csv
	-./lab2_list --yield=d --threads=8 --iterations=32 >>lab2_list.csv
	-./lab2_list --yield=id --threads=8 --iterations=2 >>lab2_list.csv
	-./lab2_list --yield=id --threads=8 --iterations=4 >>lab2_list.csv
	-./lab2_list --yield=id --threads=8 --iterations=8 >>lab2_list.csv
	-./lab2_list --yield=id --threads=8 --iterations=16 >>lab2_list.csv
	-./lab2_list --yield=id --threads=8 --iterations=32 >>lab2_list.csv
	-./lab2_list --yield=li --threads=8 --iterations=2 >>lab2_list.csv
	-./lab2_list --yield=li --threads=8 --iterations=4 >>lab2_list.csv
	-./lab2_list --yield=li --threads=8 --iterations=8 >>lab2_list.csv
	-./lab2_list --yield=li --threads=8 --iterations=16 >>lab2_list.csv
	-./lab2_list --yield=li --threads=8 --iterations=32 >>lab2_list.csv
	-./lab2_list --yield=dl --threads=8 --iterations=2 >>lab2_list.csv
	-./lab2_list --yield=dl --threads=8 --iterations=4 >>lab2_list.csv
	-./lab2_list --yield=dl --threads=8 --iterations=8 >>lab2_list.csv
	-./lab2_list --yield=dl --threads=8 --iterations=16 >>lab2_list.csv
	-./lab2_list --yield=dl --threads=8 --iterations=32 >>lab2_list.csv

	-./lab2_list --yield=i --threads=12 --iterations=2 >>lab2_list.csv
	-./lab2_list --yield=i --threads=12 --iterations=4 >>lab2_list.csv
	-./lab2_list --yield=i --threads=12 --iterations=8 >>lab2_list.csv
	-./lab2_list --yield=i --threads=12 --iterations=16 >>lab2_list.csv
	-./lab2_list --yield=i --threads=12 --iterations=32 >>lab2_list.csv
	-./lab2_list --yield=d --threads=12 --iterations=2 >>lab2_list.csv
	-./lab2_list --yield=d --threads=12 --iterations=4 >>lab2_list.csv
	-./lab2_list --yield=d --threads=12 --iterations=8 >>lab2_list.csv
	-./lab2_list --yield=d --threads=12 --iterations=16 >>lab2_list.csv
	-./lab2_list --yield=d --threads=12 --iterations=32 >>lab2_list.csv
	-./lab2_list --yield=id --threads=12 --iterations=2 >>lab2_list.csv
	-./lab2_list --yield=id --threads=12 --iterations=4 >>lab2_list.csv
	-./lab2_list --yield=id --threads=12 --iterations=8 >>lab2_list.csv
	-./lab2_list --yield=id --threads=12 --iterations=16 >>lab2_list.csv
	-./lab2_list --yield=id --threads=12 --iterations=32 >>lab2_list.csv
	-./lab2_list --yield=li --threads=12 --iterations=2 >>lab2_list.csv
	-./lab2_list --yield=li --threads=12 --iterations=4 >>lab2_list.csv
	-./lab2_list --yield=li --threads=12 --iterations=8 >>lab2_list.csv
	-./lab2_list --yield=li --threads=12 --iterations=16 >>lab2_list.csv
	-./lab2_list --yield=li --threads=12 --iterations=32 >>lab2_list.csv
	-./lab2_list --yield=dl --threads=12 --iterations=2 >>lab2_list.csv
	-./lab2_list --yield=dl --threads=12 --iterations=4 >>lab2_list.csv
	-./lab2_list --yield=dl --threads=12 --iterations=8 >>lab2_list.csv
	-./lab2_list --yield=dl --threads=12 --iterations=16 >>lab2_list.csv
	-./lab2_list --yield=dl --threads=12 --iterations=32 >>lab2_list.csv


#mutex! with yields...
	-./lab2_list --sync=m --yield=i --threads=12 --iterations=2 >>lab2_list.csv
	-./lab2_list --sync=m --yield=i --threads=12 --iterations=4 >>lab2_list.csv
	-./lab2_list --sync=m --yield=i --threads=12 --iterations=8 >>lab2_list.csv
	-./lab2_list --sync=m --yield=i --threads=12 --iterations=16 >>lab2_list.csv
	-./lab2_list --sync=m --yield=i --threads=12 --iterations=32 >>lab2_list.csv
	-./lab2_list --sync=m --yield=d --threads=12 --iterations=2 >>lab2_list.csv
	-./lab2_list --sync=m --yield=d --threads=12 --iterations=4 >>lab2_list.csv
	-./lab2_list --sync=m --yield=d --threads=12 --iterations=8 >>lab2_list.csv
	-./lab2_list --sync=m --yield=d --threads=12 --iterations=16 >>lab2_list.csv
	-./lab2_list --sync=m --yield=d --threads=12 --iterations=32 >>lab2_list.csv
	-./lab2_list --sync=m --yield=id --threads=12 --iterations=2 >>lab2_list.csv
	-./lab2_list --sync=m --yield=id --threads=12 --iterations=4 >>lab2_list.csv
	-./lab2_list --sync=m --yield=id --threads=12 --iterations=8 >>lab2_list.csv
	-./lab2_list --sync=m --yield=id --threads=12 --iterations=16 >>lab2_list.csv
	-./lab2_list --sync=m --yield=id --threads=12 --iterations=32 >>lab2_list.csv
	-./lab2_list --sync=m --yield=li --threads=12 --iterations=2 >>lab2_list.csv
	-./lab2_list --sync=m --yield=li --threads=12 --iterations=4 >>lab2_list.csv
	-./lab2_list --sync=m --yield=li --threads=12 --iterations=8 >>lab2_list.csv
	-./lab2_list --sync=m --yield=li --threads=12 --iterations=16 >>lab2_list.csv
	-./lab2_list --sync=m --yield=li --threads=12 --iterations=32 >>lab2_list.csv
	-./lab2_list --sync=m --yield=dl --threads=12 --iterations=2 >>lab2_list.csv
	-./lab2_list --sync=m --yield=dl --threads=12 --iterations=4 >>lab2_list.csv
	-./lab2_list --sync=m --yield=dl --threads=12 --iterations=8 >>lab2_list.csv
	-./lab2_list --sync=m --yield=dl --threads=12 --iterations=16 >>lab2_list.csv
	-./lab2_list --sync=m --yield=dl --threads=12 --iterations=32 >>lab2_list.csv

	-./lab2_list --sync=m --yield=i --threads=32 --iterations=2 >>lab2_list.csv
	-./lab2_list --sync=m --yield=i --threads=32 --iterations=4 >>lab2_list.csv
	-./lab2_list --sync=m --yield=i --threads=32 --iterations=8 >>lab2_list.csv
	-./lab2_list --sync=m --yield=i --threads=32 --iterations=16 >>lab2_list.csv
	-./lab2_list --sync=m --yield=i --threads=32 --iterations=32 >>lab2_list.csv
	-./lab2_list --sync=m --yield=d --threads=32 --iterations=2 >>lab2_list.csv
	-./lab2_list --sync=m --yield=d --threads=32 --iterations=4 >>lab2_list.csv
	-./lab2_list --sync=m --yield=d --threads=32 --iterations=8 >>lab2_list.csv
	-./lab2_list --sync=m --yield=d --threads=32 --iterations=16 >>lab2_list.csv
	-./lab2_list --sync=m --yield=d --threads=32 --iterations=32 >>lab2_list.csv
	-./lab2_list --sync=m --yield=id --threads=32 --iterations=2 >>lab2_list.csv
	-./lab2_list --sync=m --yield=id --threads=32 --iterations=4 >>lab2_list.csv
	-./lab2_list --sync=m --yield=id --threads=32 --iterations=8 >>lab2_list.csv
	-./lab2_list --sync=m --yield=id --threads=32 --iterations=16 >>lab2_list.csv
	-./lab2_list --sync=m --yield=id --threads=32 --iterations=32 >>lab2_list.csv
	-./lab2_list --sync=m --yield=li --threads=32 --iterations=2 >>lab2_list.csv
	-./lab2_list --sync=m --yield=li --threads=32 --iterations=4 >>lab2_list.csv
	-./lab2_list --sync=m --yield=li --threads=32 --iterations=8 >>lab2_list.csv
	-./lab2_list --sync=m --yield=li --threads=32 --iterations=16 >>lab2_list.csv
	-./lab2_list --sync=m --yield=li --threads=32 --iterations=32 >>lab2_list.csv
	-./lab2_list --sync=m --yield=dl --threads=32 --iterations=2 >>lab2_list.csv
	-./lab2_list --sync=m --yield=dl --threads=32 --iterations=4 >>lab2_list.csv
	-./lab2_list --sync=m --yield=dl --threads=32 --iterations=8 >>lab2_list.csv
	-./lab2_list --sync=m --yield=dl --threads=32 --iterations=16 >>lab2_list.csv
	-./lab2_list --sync=m --yield=dl --threads=32 --iterations=32 >>lab2_list.csv
#spin! with yields...
	-./lab2_list --sync=s --yield=i --threads=12 --iterations=2 >>lab2_list.csv
	-./lab2_list --sync=s --yield=i --threads=12 --iterations=4 >>lab2_list.csv
	-./lab2_list --sync=s --yield=i --threads=12 --iterations=8 >>lab2_list.csv
	-./lab2_list --sync=s --yield=i --threads=12 --iterations=16 >>lab2_list.csv
	-./lab2_list --sync=s --yield=i --threads=12 --iterations=32 >>lab2_list.csv
	-./lab2_list --sync=s --yield=d --threads=12 --iterations=2 >>lab2_list.csv
	-./lab2_list --sync=s --yield=d --threads=12 --iterations=4 >>lab2_list.csv
	-./lab2_list --sync=s --yield=d --threads=12 --iterations=8 >>lab2_list.csv
	-./lab2_list --sync=s --yield=d --threads=12 --iterations=16 >>lab2_list.csv
	-./lab2_list --sync=s --yield=d --threads=12 --iterations=32 >>lab2_list.csv
	-./lab2_list --sync=s --yield=id --threads=12 --iterations=2 >>lab2_list.csv
	-./lab2_list --sync=s --yield=id --threads=12 --iterations=4 >>lab2_list.csv
	-./lab2_list --sync=s --yield=id --threads=12 --iterations=8 >>lab2_list.csv
	-./lab2_list --sync=s --yield=id --threads=12 --iterations=16 >>lab2_list.csv
	-./lab2_list --sync=s --yield=id --threads=12 --iterations=32 >>lab2_list.csv
	-./lab2_list --sync=s --yield=li --threads=12 --iterations=2 >>lab2_list.csv
	-./lab2_list --sync=s --yield=li --threads=12 --iterations=4 >>lab2_list.csv
	-./lab2_list --sync=s --yield=li --threads=12 --iterations=8 >>lab2_list.csv
	-./lab2_list --sync=s --yield=li --threads=12 --iterations=16 >>lab2_list.csv
	-./lab2_list --sync=s --yield=li --threads=12 --iterations=32 >>lab2_list.csv
	-./lab2_list --sync=s --yield=dl --threads=12 --iterations=2 >>lab2_list.csv
	-./lab2_list --sync=s --yield=dl --threads=12 --iterations=4 >>lab2_list.csv
	-./lab2_list --sync=s --yield=dl --threads=12 --iterations=8 >>lab2_list.csv
	-./lab2_list --sync=s --yield=dl --threads=12 --iterations=16 >>lab2_list.csv
	-./lab2_list --sync=s --yield=dl --threads=12 --iterations=32 >>lab2_list.csv

	-./lab2_list --sync=s --yield=i --threads=32 --iterations=2 >>lab2_list.csv
	-./lab2_list --sync=s --yield=i --threads=32 --iterations=4 >>lab2_list.csv
	-./lab2_list --sync=s --yield=i --threads=32 --iterations=8 >>lab2_list.csv
	-./lab2_list --sync=s --yield=i --threads=32 --iterations=16 >>lab2_list.csv
	-./lab2_list --sync=s --yield=i --threads=32 --iterations=32 >>lab2_list.csv
	-./lab2_list --sync=s --yield=d --threads=32 --iterations=2 >>lab2_list.csv
	-./lab2_list --sync=s --yield=d --threads=32 --iterations=4 >>lab2_list.csv
	-./lab2_list --sync=s --yield=d --threads=32 --iterations=8 >>lab2_list.csv
	-./lab2_list --sync=s --yield=d --threads=32 --iterations=16 >>lab2_list.csv
	-./lab2_list --sync=s --yield=d --threads=32 --iterations=32 >>lab2_list.csv
	-./lab2_list --sync=s --yield=id --threads=32 --iterations=2 >>lab2_list.csv
	-./lab2_list --sync=s --yield=id --threads=32 --iterations=4 >>lab2_list.csv
	-./lab2_list --sync=s --yield=id --threads=32 --iterations=8 >>lab2_list.csv
	-./lab2_list --sync=s --yield=id --threads=32 --iterations=16 >>lab2_list.csv
	-./lab2_list --sync=s --yield=id --threads=32 --iterations=32 >>lab2_list.csv
	-./lab2_list --sync=s --yield=li --threads=32 --iterations=2 >>lab2_list.csv
	-./lab2_list --sync=s --yield=li --threads=32 --iterations=4 >>lab2_list.csv
	-./lab2_list --sync=s --yield=li --threads=32 --iterations=8 >>lab2_list.csv
	-./lab2_list --sync=s --yield=li --threads=32 --iterations=16 >>lab2_list.csv
	-./lab2_list --sync=s --yield=li --threads=32 --iterations=32 >>lab2_list.csv
	-./lab2_list --sync=s --yield=dl --threads=32 --iterations=2 >>lab2_list.csv
	-./lab2_list --sync=s --yield=dl --threads=32 --iterations=4 >>lab2_list.csv
	-./lab2_list --sync=s --yield=dl --threads=32 --iterations=8 >>lab2_list.csv
	-./lab2_list --sync=s --yield=dl --threads=32 --iterations=16 >>lab2_list.csv
	-./lab2_list --sync=s --yield=dl --threads=32 --iterations=32 >>lab2_list.csv
#many iterations, no yields
	-./lab2_list --iterations=1000 >> lab2_list.csv
	-./lab2_list --threads=2 --iterations=1000 >>lab2_list.csv
	-./lab2_list --sync=m --threads=1 --iterations=1000 >>lab2_list.csv 
	-./lab2_list --sync=m --threads=2 --iterations=1000 >>lab2_list.csv
	-./lab2_list --sync=m --threads=4 --iterations=1000 >>lab2_list.csv
	-./lab2_list --sync=m --threads=8 --iterations=1000 >>lab2_list.csv
	-./lab2_list --sync=m --threads=12 --iterations=1000 >>lab2_list.csv
	-./lab2_list --sync=m --threads=16 --iterations=1000 >>lab2_list.csv
	-./lab2_list --sync=m --threads=24 --iterations=1000 >>lab2_list.csv
	-./lab2_list --sync=s --threads=1 --iterations=1000 >>lab2_list.csv 
	-./lab2_list --sync=s --threads=2 --iterations=1000 >>lab2_list.csv
	-./lab2_list --sync=s --threads=4 --iterations=1000 >>lab2_list.csv
	-./lab2_list --sync=s --threads=8 --iterations=1000 >>lab2_list.csv
	-./lab2_list --sync=s --threads=12 --iterations=1000 >>lab2_list.csv
	-./lab2_list --sync=s --threads=16 --iterations=1000 >>lab2_list.csv
	-./lab2_list --sync=s --threads=24 --iterations=1000 >>lab2_list.csv
