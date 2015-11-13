#import <Foundation/Foundation.h>


int main(int argc, char const *argv[])
{
	@autoreleasepool{

		[[NSNotificationCenter defaultCenter] 
			addObserverForName:NSSystemTimeZoneDidChangeNotification 
			object:nil
			queue:nil
			usingBlock:^(NSNotification *note){
				NSLog(@"The system time zone has changed !");
			}
			];

		[[NSRunLoop currentRunLoop] run];
	}
	return 0;
}