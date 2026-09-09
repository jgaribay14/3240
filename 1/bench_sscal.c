#include <stdio.h>
#include <stdlib.h>

void sscal(int length, int a, float *x, int stride);

int main( void ) {
  const int N = 200000000; // The benchmark runs on a fixed size of work
  printf( "Running SSCAL operation of size %d x 1\n", N );
  int a = 13;                                            // Scalar
  float *x = (float *) malloc( N * sizeof(float) );      // Input array
  int stride = 2;

  // Carry out the operation
  sscal( N, a, x, stride );

  // Free up the memory
  free( x );

  return 0;
}

