#import <Foundation/Foundation.h>
#import "BNRForengiStockHolding.h"
#import "BNRPortfolio.h"
int main(int argc, char const *argv[])
{
	@autoreleasepool
	{
		BNRStockHolding *h1 = [[BNRStockHolding alloc] init];
		[h1 setPurchasePrice:2.30];
		[h1 setCurrentPrice:4.5];
		[h1 setNumberOfShares:40];
		[h1 setSymbol:@"XYZ"];

		BNRStockHolding *h2 = [[BNRStockHolding alloc] init];
		[h2 setPurchasePrice:2.30];
		[h2 setCurrentPrice:4.60];
		[h2 setNumberOfShares:50];
		[h2 setSymbol:@"ABC"];

		BNRForengiStockHolding *h3 = [[BNRForengiStockHolding alloc] init];
		[h3 setPurchasePrice:2.30];
		[h3 setCurrentPrice:2.50];
		[h3 setNumberOfShares:20];
		[h3 setConversionRate:0.91];
		[h3 setSymbol:@"LMN"];

		NSMutableArray *array = [NSMutableArray array];
		[array addObject:h1];
		[array addObject:h2];
		[array addObject:h3];

		for(BNRStockHolding *obj in array)
		{
			NSLog(@" --cost= %.2f ， value=%.2f " ,[obj costInDollars], [obj valueInDollars]);
		}

		BNRPortfolio *port = [[BNRPortfolio alloc] init];
		[port addStock:h1];
		[port addStock:h2];
		[port addStock:h3];
		[port removeStock:h1];
		NSLog(@"%.2f", [port totalValue]);
	}
	return 0;
}