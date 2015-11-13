#import <Foundation/Foundation.h>
/*
 * 通过NSString读取文件
 */
int main(int argc, char const *argv[])
{
	@autoreleasepool{
		NSError *error;
		NSString *str = [[NSString alloc] initWithContentsOfFile:@"/etc/resolv.conf" encoding:NSASCIIStringEncoding error:&error];
		if (!str)
		{
			NSLog(@"read failed:%@", [error localizedDescription]);
		}
		else
		{
			NSLog(@"resolv.conf looks like this:%@", str);
		}
	}
	return 0;
}