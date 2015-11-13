#import <Foundation/Foundation.h>

/*
 *通过NSDate对象，将所保存的数据写入文件
 *
 */
int main(int argc, char const *argv[])
{
	@autoreleasepool{
		NSURL *url = [NSURL URLWithString:@"https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png"];
		NSURLRequest *request = [NSURLRequest requestWithURL:url];
		NSError *error = nil;
		NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:&error];
		if(!data)
		{
			NSLog(@"fetch failed :%@", [error localizedDescription]);
			return 1;
		}

		NSLog(@"The file is %lu bytes", (unsigned long)[data length]);

		BOOL written = [data writeToFile:@"1.png" options:NSDataWritingAtomic error:&error];
		if(!written)
		{
			NSLog(@"write failed :%@" , [error localizedDescription]);
			return 1;
		}
		NSLog(@"success!");

		/*
		  从文件读取数据并存入NSData对象
		*/
		  NSData *readData = [NSData dataWithContentsOfFile:@"1.png" ];
		  NSLog(@"THe file read from the disk has %lu bytes.",(unsigned long)[readData length]);


		  /*寻找特别目录*/
		  NSArray *desktops = NSSearchPathForDirectoriesInDomains (NSDesktopDirectory, NSUserDomainMask,YES);
		  NSLog(@"SearchPath:%@", desktops);
	}
	return 0;
}