#import "BNREmployee.h"
#import "BNRAsset.h"


@interface BNREmployee()
{
	NSMutableSet *_assets;
}
@property (nonatomic) unsigned int officeAlarmCode;

@end

@implementation BNREmployee

//属性的存取方法
- (void)setAssets:(NSArray *)a
{
	_assets = [a mutableCopy];
}
- (NSArray*)assets
{
	return [_assets copy];
}

-(void)addAsset:(BNRAsset *)a
{
	if (!_assets)
	{
		_assets = [[NSMutableSet alloc] init];
	}
	[_assets addObject:a];
	a.holder = self;
}

-(unsigned int)valueOfAssets
{
	unsigned int sum =0;
	for(BNRAsset *a in _assets)
	{
		sum += [a resaleValue];
	}
	return sum;
}


- (double) yearOfEmployment
{
	if (self.hireDate)
	{
		NSDate * now = [NSDate date];
		NSTimeInterval secs = [now timeIntervalSinceDate:self.hireDate];
		return secs / 31557600.0;//每年的秒数
	}
	else
	{
		return 0;
	}
}

-(float)bodyMassIndex
{
	//return 19.0;
	float normalBMI = [super bodyMassIndex];
	return normalBMI * 0.9 ;
}

-(NSString *)description
{
	return [NSString stringWithFormat:@"<Employee %u: $%u in assets>", self.employeeID , self.valueOfAssets];
}

- (void)dealloc
{
	NSLog(@"dealloc %@",self);
}
@end