#include <stdlib.h> 
#include <stdio.h>

// -g is the debug flag
void arraymult(int n, int *a, int *b);

int main( int argc, char** argv ) { 
    // Create two large arrays 
    const int length = 20000000;
    int* a = (int*) malloc( sizeof(int) * length ); 
    int* b = (int*) malloc( sizeof(int) * length );

	arraymult(length, a, b);

    free(a); 
    free(b);
    return 0;
} 
