#include <stdio.h>
#include <stdlib.h>

void dgemm(int length, double *A, double *B, double *C);

int main( void ) {
  const int N = 1024; // The benchmark runs on a fixed size of work
  printf( "Running DGEMM operation of size %d x 1\n", N );
  double *A = (double *) malloc(N * N * sizeof(double));
  double *B = (double *) malloc(N * N * sizeof(double));
  double *C = (double *) malloc(N * N * sizeof(double));

  // Carry out the operation
  dgemm( N, A, B, C);

  // Free up the memory
  free( A );
  free( B );
  free( C );

  return 0;
}

