#import "BNRStockHolding.h"

@implementation BNRStockHolding

- (float) purchaseSharePrice
{
	return _purchaseSharePrice;
}
- (void ) setPruchaseSharePrice:(float)p
{
	_purchaseSharePrice = p;
}

-(float)currentSharePrice
{
	return _currentSharePrice;
}
-(void)setCurrentSharePrice:(float)c
{
	_currentSharePrice = c;
}

-(int) numberOfShares
{
	return _numberOfShares;
}

- (void )setNumberOfShares:(int)n
{
	_numberOfShares = n;
}

- (float) costInDollars
{
	return self.purchaseSharePrice * self.numberOfShares;
}

- (float) valueInDollars
{
	return self.currentSharePrice * self.numberOfShares;
}


@end 