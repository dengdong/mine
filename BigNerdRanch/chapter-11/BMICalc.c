#include <stdio.h>

//声明Person结构
/*
//声明结构第一种方法
struct Person
{
	float heightInMeters;
	int weightInKilos;
};
*/

//声明结构第二种方法,使用typeef：
typedef struct
{
	float heightInMeters;
	int weightInKilos;
} Person ;

float bodyMassIndex(Person p)
{
	return p.weightInKilos / (p.heightInMeters * p.heightInMeters);
}

int main(int argc, char const *argv[])
{
	//struct Person mikey;
	Person mikey;
	mikey.heightInMeters = 1.7;
	mikey.weightInKilos = 96;

	//struct Person aaron ;
	Person aaron;
	aaron.heightInMeters = 1.97;
	aaron.weightInKilos = 84;

	printf("mikey is %.2f meters tall\n", mikey.heightInMeters );
	printf("mikey weights %d kilograms\n", mikey.weightInKilos );

	printf("aaron is %.2f meters tall\n", aaron.heightInMeters );
	printf("aaron weights %d kilograms\n",  aaron.weightInKilos);

	float bmi;
	bmi = bodyMassIndex(mikey);
	printf("mikey has a BMI of %.2f \n", bmi );

	bmi = bodyMassIndex(aaron);
	printf("aaron has BMI of %.2f \n", bmi  );

	return 0;
}