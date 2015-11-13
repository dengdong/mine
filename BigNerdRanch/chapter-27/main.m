#import <Foundation/Foundation.h>
#import "BNRLogger.h"

int main(int argc, char const *argv[])
{
	@autoreleasepool{

		BNRLogger *logger = [[BNRLogger alloc] init];

		//通知
		[[NSNotificationCenter defaultCenter]
			addObserver:logger 
			selector:@selector(zoneChange:)
			name:NSSystemTimeZoneDidChangeNotification
			object:nil];

		//辅助对象  
		//http://www.gutenberg.org/cache/epub/205/pg205.txt
		NSURL *url = [NSURL URLWithString:@"http://www.gutenberg.org/cache/epub/205/pg205.txt"];
		NSURLRequest *request = [NSURLRequest requestWithURL:url];

		__unused NSURLConnection *fetchConn = 
						[[NSURLConnection alloc] initWithRequest:request delegate:logger startImmediately:YES];


		//目标-动作对
		__unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:60.0 target:logger selector:@selector(updateLastTime:) userInfo:nil repeats:YES];



		[[NSRunLoop currentRunLoop] run];
	}
	return 0;
}