#include <stdio.h>

void showCookTimerForTukey(int pounds)
{
	int necessaryMinutes = 15+ 15* pounds;
	printf("Cook for %d minutes.\n", necessaryMinutes );
	if (necessaryMinutes > 120)
	{
		int halfway = necessaryMinutes / 2;
		printf("Rotate after %d of the %d minutes.\n", halfway, necessaryMinutes );
	}
}

int main(int argc, char const *argv[])
{
	
	int totalWeight = 10;
	int gibletsWeight=1;
	int turkeyWeight= totalWeight - gibletsWeight;
	showCookTimerForTukey(turkeyWeight);
	return 0;
}