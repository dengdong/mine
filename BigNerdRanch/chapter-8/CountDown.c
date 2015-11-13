#include <stdio.h>
#include <stdlib.h>

int main(int argc, char const *argv[])
{
	
	int i = 99;
	while(i>=0){
		printf("%d\n",  i);
		if (i%5==0)
		{
			printf("Found one\n");
		}
		i -= 3;
	}
	return 0;
}