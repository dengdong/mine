
#import "BNRStockHolding.h"


@implementation BNRStockHolding

- (float) costInDollars
{
	return [self purchasePrice] * [self numberOfShares];
}

- (float)valueInDollars
{

	return [self currentPrice] * [self numberOfShares];
}

-(NSString *)description
{
	return [NSString stringWithFormat: @"<%d>", [self numberOfShares]];
}

@end