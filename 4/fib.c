#include <stdio.h>

int main()
{
	int a = 0;
	int b = 1;
	int n = 10;

	for (int i = 2; i <= n; i++) {
		int temp = a + b;
		a = b;
		b = temp;
	}

	printf("%d\n", b);

	return 0;
}
