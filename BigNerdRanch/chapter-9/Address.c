#include <stdio.h>

int main(int argc, const char* argv[])
{
	int i = 17;
	int *addressOfI = &i;
	printf("i stores its value at %p\n", addressOfI);
	printf("this function starts at %p\n", main);
	printf("the int stored at addressOfI is %d \n", *addressOfI);
	*addressOfI = 89;
	printf("Now is %d\n", *addressOfI );
	//不同类型的数组所占的字节大小
	printf("An int is %zu bytes\n", sizeof(int) );
	printf("An pointer is %zu bytes\n", sizeof(int*) );
	printf("An float is %zu bytes \n", sizeof(float) );
	return 0;
}
