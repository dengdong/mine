#import <Foundation/Foundation.h>
//#import "BNRPerson.h"

#import "BNREmployee.h"

int main(int argc, char const *argv[])
{
	@autoreleasepool{
		BNREmployee *mikey = [[BNREmployee alloc] init];
		mikey.weightInKilos = 96;
		mikey.heightInMeters = 1.8;
		mikey.employeeID = 12;
		mikey.hireDate = [NSDate dateWithNaturalLanguageString:@"Aug 2nd , 2010"];

		float height = mikey.heightInMeters;
		int weight = mikey.weightInKilos;

		NSLog (@"mikey is %.2f meters tall and weights %d kilos", height , weight);
		NSLog (@"Employee %u hired on %@" , mikey.employeeID, mikey.hireDate);

		float bmi = [mikey bodyMassIndex];
		double years = [mikey yearOfEmployment];
		NSLog(@"mikey has a BMI of %.2f , has worked us for %.2f years", bmi , years);

		NSLog(@"%@ hired on %@", mikey, [mikey hireDate]);
		NSLog(@"----");
	}
	return 0;
}
