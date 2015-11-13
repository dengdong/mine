#import <Foundation/Foundation.h>

//#define M_PI 3.1415926535897

int main(int argc , const char * argv [])
{
	@autoreleasepool{
		NSLog(@"\u03c0 is %f",M_PI);
		NSLog(@"%d is larger", MAX(10,12));

		NSLocale *here = [NSLocale currentLocale];
		NSString *currency = [here objectForKey:@"currency"];
		NSString *currency1 = [here objectForKey:NSLocaleCurrencyCode];
		NSLog(@"currency is %@", currency);
		NSLog(@"currency is %@", currency1);
	}
	return 0;
}

