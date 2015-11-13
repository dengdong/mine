#include <stdio.h>

int main(int argc, char const *argv[])
{
	int i=0;
	/*
	while(i< 12){
		printf("%d .Aaron is Cool.\n", i);
		i++;
	}
	*/
	for ( i = 0; i < 12; ++i)
	{
		if (i%3 == 0)
		{
			continue;
		}
		printf("Checking i = %d\n", i);
		if (i+ 90 == i*i)
		{
			break;
		}
	}
	printf("The answer is %d\n",i );
	return 0;
}