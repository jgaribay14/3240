#include <stdlib.h>
#include <stdio.h>

void myFMA(int length, float *a, float *b, float *c);

int main( int argc, char** argv ) { 
    // Create two large arrays 
    const int length = 20000000; 
    float* a = (float*) malloc( sizeof(float) * length ); 
    float* b = (float*) malloc( sizeof(float) * length );
    float* c = (float*) malloc( sizeof(float) * length );
	
    // Do some arbitrarily hard amount of work. 
	myFMA( length, a, b, c );
	
    free(a); 
    free(b);
    free(c);
    return 0;
}
