#import "BNRAsset.h"
#import "BNREmployee.h"

@implementation BNRAsset

- (NSString *)description
{
	//return [NSString stringWithFormat:@"<%@:$%u", self.label, self.resaleValue];
	if (self.holder)
	{
		return [NSString stringWithFormat:@"<%@:$%d,assigned to %@>", self.label,self.resaleValue,self.holder];
	}
	else
	{
		return [NSString stringWithFormat:@"<%@:$%d unassigned>",self.label,self.resaleValue];
	}
}

//当类的实例被释放时，执行dealloc
- (void)dealloc
{
	NSLog(@"deallocating %@",self);
}

@end