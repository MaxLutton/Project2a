default:
	gcc -g -lpthread -lrt -o lab2_add lab2_add.c
	gcc -g -lpthread -lrt -o lab2_list lab2_add.c SortedList.c

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
