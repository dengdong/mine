#include <stdio.h>

int main(int argc, char const *argv[])
{
	float weight;

	weight = 14.2;

	printf("The turkey weights %f.\n", weight);

	float cookingTime;

	cookingTime = 15.0+ 15.0* weight;

	printf("Cook it for %f minutes.\n", cookingTime );
	return 0;
}