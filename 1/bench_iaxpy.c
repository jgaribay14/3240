#include <stdio.h>
#include <stdlib.h>

void iaxpy( int length, int a, int *x, int *y, int *result );

int main( void ) {
  const int N = 200000000; // The benchmark runs on a fixed size of work
  printf( "Running IAXPY operation of size %d x 1\n", N );
  int a = 13;                                      // Arbitrary value
  int *x = (int *) malloc( N * sizeof(int) );      // First vector
  int *y = (int *) malloc( N * sizeof(int) );      // Second vector
  int *result = (int *) malloc( N * sizeof(int) ); // Result vector

  // Carry out the operation
  iaxpy( N, a, x, y, result );

  // Free up the memory
  free( x );
  free( y );
  free( result );

  return 0;
}

