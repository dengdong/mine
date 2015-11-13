#import <Foundation/Foundation.h>

int main(int argc, char const *argv[])
{
	@autoreleasepool{

		//NSDate *now = [NSDate date];
		NSDate *now = [[NSDate alloc] init];
		NSLog(@"This NSDate object lives at %p", now);
		NSLog(@"The Date is %@", now);
		double seconds = [now timeIntervalSince1970];
		NSLog(@"In  100,000 seconds it will be %@", now);	
		NSDate *later = [now dateByAddingTimeInterval:100000];
		NSLog(@"In  100,000 seconds it will be %@", later);	

		NSCalendar *cal = [NSCalendar currentCalendar];
		NSLog(@"My calendar is %@", cal);

		unsigned long day = [cal ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:now];
		NSLog(@"This is day %lu of the month", day);
	}
	return 0;
}