#include <stdio.h>
#include <stdlib.h>

typedef struct {
	float heightInmeters;
	int weightInKilos;
}Person;

float bodyMassIndex(Person *p)
{
	return p->weightInKilos/(p->heightInmeters*p->heightInmeters);
}

int main(int argc, char const *argv[])
{
	//为一个Person结构分配内存
	Person *mikey = (Person *)malloc(sizeof(Person));
	//为一个Person结构分配内存
	mikey->weightInKilos = 96;
	mikey->heightInmeters = 1.7;

	//计算并输出BMI
	float mikeyBMI = bodyMassIndex(mikey);
	printf("mikey has a BMI of %f\n", mikeyBMI );

	//释放占用内存，使之能够被重用
	free(mikey);

	//将指针变量赋值为空
	mikey = NULL;
	return 0;
}