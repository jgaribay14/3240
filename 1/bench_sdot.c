#include <stdio.h>
#include <stdlib.h>

float sdot(int length, float *X, float *Y);

int main(void) {
  const int N = 200000000; // The benchmark runs on a fixed size of work
  printf( "Running SDOT operation of size %d x 1\n", N );
  float *X = (float *)malloc(N *sizeof(float));
  float *Y = (float *)malloc(N *sizeof(float));

  // Carry out the operation
  sdot( N, X, Y);

  // Free up the memory
  free( X );
  free( Y );

  return 0;
}

