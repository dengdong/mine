#import <Foundation/Foundation.h>

int main(int argc, char const *argv[])
{
	@autoreleasepool{
	NSArray *array = @[@"1",@"2",@"m",@"3",@"4"];
	NSRange range = NSMakeRange(1,3);
	NSUInteger i = [array indexOfObject:@"m" inRange:range];
	NSLog(@"%lu",i);
}
	return 0;
}