CC=gcc
CFLAGS=-Wall -O0

all: bench_iaxpy.out bench_sscal.out bench_dgemm.out bench_sdot.out

bench_iaxpy.o: bench_iaxpy.c
	${CC} ${CFLAGS} -c $^ -o $@
iaxpy.o: iaxpy.c
	${CC} ${CFLAGS} -c $^ -o $@
bench_iaxpy.out: bench_iaxpy.o iaxpy.o
	${CC} ${CFLAGS} -o $@ $^

bench_sscal.o: bench_sscal.c
	${CC} ${CFLAGS} -c $^ -o $@
sscal.o: sscal.c
	${CC} ${CFLAGS} -c $^ -o $@
bench_sscal.out: bench_sscal.o sscal.o
	${CC} ${CFLAGS} -o $@ $^

bench_dgemm.o: bench_dgemm.c
	${CC} ${CFLAGS} -c $^ -o $@
dgemm.o: dgemm.c
	${CC} ${CFLAGS} -c $^ -o $@
bench_dgemm.out: bench_dgemm.o dgemm.o
	${CC} ${CFLAGS} -o $@ $^

bench_sdot.o: bench_sdot.c
	${CC} ${CFLAGS} -c $^ -o $@
sdot.o: sdot.c
	${CC} ${CFLAGS} -c $^ -o $@
bench_sdot.out: bench_sdot.o sdot.o
	${CC} ${CFLAGS} -o $@ $^
	
clean:
	rm -f *.o *.out

