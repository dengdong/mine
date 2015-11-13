
#import "BNRForengiStockHolding.h"


@implementation BNRForengiStockHolding

- (float) costInDollars
{
	float cost = [super costInDollars];
	return cost * [self conversionRate];
}

- (float) valueInDollars
{
	float value = [super valueInDollars];
	return value * [self conversionRate];
}


@end