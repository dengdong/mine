#import "BNRPortfolio.h"
#import "BNRStockHolding.h"

@interface BNRPortfolio()
//{
//	NSMutableArray *_holdings;
//}
@property (nonatomic,copy) NSMutableArray *holdings;
@end

@implementation BNRPortfolio
/*
-(void) setHoldings:(NSArray *)a 
{
	_holdings = [a copy];
}

-(NSArray *)holdings
{
	return [_holdings copy];
}*/

-(void)addStock:(BNRStockHolding*) h 
{
	
	if (!_holdings)
	{
		_holdings = [[NSMutableArray alloc] init];
	}
	/*
	[_holdings addObject:h];
	*/
	[_holdings addObject:h];
	
}

-(void)removeStock:(BNRStockHolding*)h 
{
	[_holdings removeObject:h];
}


-(float) totalValue
{
	float sum = 0.0;
	NSLog(@"count-%lu", [_holdings count]);
	for(BNRStockHolding *h in _holdings)
	{
		NSLog(@"%@",h);
		sum += [h valueInDollars];
	}
	return sum;
}

@end