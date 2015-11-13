#include <stdio.h>

//声明一个全局变量
float lastTemperature;

float fahrenheitFromCelsius(float cel)
{
	lastTemperature = cel;
	float fahr = cel*1.8+ 32.0;
	printf("%f Celsius is %f Fahrenheit\n", cel, fahr );
	return fahr;
}

int main(int argc, char const *argv[])
{
	float  freezeInC  = 0;
	float freezeInF = fahrenheitFromCelsius(freezeInC);
	printf("Water freezes at %f degrees Fahrenheit\n", freezeInF );
	printf("The last temperature converted was %f\n", lastTemperature );
	return 0;
}