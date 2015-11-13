#include <stdio.h>
#include <math.h>

void metersToFeetAndInches(double meters, unsigned int *ftPtr, double *inPtr)
{
	//这个函数假定meters的值是非负数

	//将meters变量的值转化为feet的值，类型为浮点数
	double rawFeet = meters * 3.281;

	/*
	//计算类型为无符号的整形feet变量的值
	unsigned int feet = (unsigned int )floor(rawFeet);

	//计算英寸
	double fractionalFoot = rawFeet - feet;
	double inches = fractionalFoot * 12.0;
	*/

	double  feet ;
	double fractionalFoot = modf(rawFeet,&feet);
	double inches = fractionalFoot * 12.0 ;
	//将feet变量的值储存在提供的地址里
	if(ftPtr)
	{
		printf("Storing %.0f to the address %p\n",feet,ftPtr );
		*ftPtr = feet;
	}
	

	//将inches变量的值保存在传入的地址里
	if (inPtr)
	{
		printf("Storing %.2f to the address %p\n", inches, inPtr );
		*inPtr = inches;
	}
}

int main(int argc, char const *argv[])
{
	double pi = 3.14;
	double integerPart;
	double fractionPart;

	//将integerPart的地址作为实参传入
	fractionPart = modf(pi, &integerPart);
	printf("integerPart = %.0f , fractionPart = %.2f\n", integerPart, fractionPart);

	double meters = 3.0 ;
	unsigned int feet ;
	double inches;

	metersToFeetAndInches(meters, &feet, &inches);
	printf("%.1f meters is eques to %d feet and %.1f inches.\n", meters, feet , inches );

	return 0;
}