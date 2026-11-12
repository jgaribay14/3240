all: unroll.out simd2.out unroll_simd.out

# the executables
unroll.out: test_fma.o unroll.o
	gcc -Wall -O0 test_fma.o unroll.o -ounroll.out
simd2.out: test_fma.o simd2.o
	gcc -Wall -O0 test_fma.o simd2.o -osimd2.out
unroll_simd.out: test_fma.o unroll_simd.o
	gcc -Wall -O0 test_fma.o unroll_simd.o -ounroll_simd.out

# the assembly object files
unroll.o: unroll.s
	gcc -Wall -O0 -c unroll.s -ounroll.o
simd2.o: simd2.s
	gcc -Wall -O0 -c simd2.s -osimd2.o
unroll_simd.o: unroll_simd.s
	gcc -Wall -O0 -c unroll_simd.s -ounroll_simd.o

test_fma.o: test_fma.c
	gcc -Wall -O0 -c test_fma.c -otest_fma.o

clean:
	rm -f *.out *.o
