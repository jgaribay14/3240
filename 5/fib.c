#include <stdio.h>

int fib(int);
int main()
{
	printf("fib(8) = %i", fib(8));
	return 0;
}
int fib(int n) {
	if (n <= 0)
		return n;
	else {
		return fib( n - 2 ) + fib( n - 1 );
	}
}
