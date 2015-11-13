#import <Foundation/Foundation.h>


int main(int argc, char const *argv[])
{
	NSHost *host = [NSHost currentHost];
	NSString *str = [host localizedName];
	NSLog(@"%@", str);
	return 0;
}
