all: part0.out part1-static.out part1-dynamic.out part2.out

part0.out: part0.s
	gcc -Wall -O0 -g -c -o part0.o part0.s
	gcc -Wall -O0 -g -o part0.out part0.o

part1-static.out: part1-static.s
	gcc -Wall -O0 -g -c -o part1-static.o part1-static.s
	gcc -Wall -O0 -g -o part1-static.out part1-static.o

part1-dynamic.out: part1-dynamic.s
	gcc -Wall -O0 -g -c -o part1-dynamic.o part1-dynamic.s
	gcc -Wall -O0 -g -o part1-dynamic.out part1-dynamic.o

part2.out: part2.s
	gcc -Wall -O0 -g -c -o part2.o part2.s
	gcc -Wall -O0 -g -o part2.out part2.o

clean:
	rm -f *.out *.o

