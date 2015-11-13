#import <Foundation/Foundation.h> 
#import "BNRPerson.h"


int main(int argc, char const *argv[])
{
	@autoreleasepool{
		//创建BNRPerson实例
		BNRPerson *mikey = [[BNRPerson alloc] init];

		[mikey setHeightInMeters:1.8];
		[mikey setWeightInKilos:96];

		float height = [mikey heightInMeters];
		int weight = [mikey weightInKilos];
		NSLog(@"mikey is %.2f meters tall and weights %d kilograms." , height, weight);

		float bmi = [mikey bodyMassIndex];
		NSLog(@"mikey has a BMI of %f", bmi);

	}
	return 0;
}