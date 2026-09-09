// gcc -O0 -Wall -o main.out main.c
// -O0 tells it not to optimize the code
// :%!xxd to go to binary
// :%!xxd -r to go back
#include <stdio.h>

int a = 4660;

int main() {
    printf("%d\n", a);
    return 0;
}

