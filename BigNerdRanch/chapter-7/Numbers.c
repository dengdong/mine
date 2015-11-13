#include <stdio.h>
#include <stdlib.h>

int main(int argc, char const *argv[])
{
	int x = 255;
	printf("x is %d.\n", x);
	printf("x is %o\n", x);
	printf("x is %x.\n",x );

	printf("3 * 3 + 5 * 2 = %d\n", 3 * 3 + 5 * 2);
	printf(" 11 / 3 = %d remainder of %d \n", 11/ 3, 11 % 3 );
	printf("11 / 3.0 = %f\n", 11/(float)3 );

	printf("THe absolute value of -5 is %d\n", abs(-5) );

	double y = 1234.56789;
	printf("y is %.2f\n", y);
	printf("y is %.2e\n", y);
	return 0;
}