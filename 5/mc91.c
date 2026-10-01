#include <stdio.h>

int mc91(int);
int main()
{
	printf("mc91(50) = %i", mc91(50));
	return 0;
}
int mc91(int n) {
	if (n > 100)
		return n - 10;
	else
		return mc91(mc91(n+11));
}
