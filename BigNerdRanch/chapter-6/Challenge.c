#include <stdio.h>

int Square(int num)
{
	return num*num;
}

int main(int argc,char const *argv[])
{
	int num = 5;
	int result = Square(5);
	printf("\"%d\" squared is \"%d\"\n", num, result);
}
