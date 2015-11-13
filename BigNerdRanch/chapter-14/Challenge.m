#import <Foundation/Foundation.h>

int main(int argc, char const *argv[])
{
	@autoreleasepool{
		NSDate *now = [NSDate date];
		
		NSDateComponents * comps = [[NSDateComponents alloc] init];
		[comps setYear:1989];
		[comps setMonth:11];
		[comps setDay:8];
		[comps setHour:18];
		[comps setMinute:11];
		[comps setSecond:13];
		NSCalendar *g = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
		NSDate *dateOfBirth = [g dateFromComponents:comps];
		NSLog(@"%@", dateOfBirth);

		double secondsSince1970 = [now timeIntervalSinceDate:dateOfBirth];
		NSLog(@"%.0f", secondsSince1970);
	}
	return 0;
}

