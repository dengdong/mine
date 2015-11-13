#import <Foundation/Foundation.h>
#import "BNRPerson.h"


int main(int argc, char const *argv[])
{
	@autoreleasepool{
		BNRPerson *mikey = [[BNRPerson alloc] init];
		mikey.weightInKilos = 96;
		mikey.heightInMeters = 1.8;

		float height = mikey.heightInMeters;
		int weight = mikey.weightInKilos;

		NSLog (@"mikey is %.2f meters tall and weights %d kilos", height , weight);

		float bmi = [mikey bodyMassIndex];
		NSLog(@"mikey has a BMI of %.2f", bmi );
	}
	return 0;
}
