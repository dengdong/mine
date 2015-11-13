#import <Foundation/Foundation.h>
#import "BNRStockHolding.h"

int main(int argc, char const *argv[])
{
	@autoreleasepool{

		BNRStockHolding *h1 = [[BNRStockHolding alloc] init];
		[h1 setPruchaseSharePrice :1.11];
		[h1 setCurrentSharePrice :1.01];
		[h1 setNumberOfShares : 1000];

		BNRStockHolding *h2 = [[BNRStockHolding alloc ]init];
		[h2 setPruchaseSharePrice : 1.99];
		[h2 setCurrentSharePrice : 2.22];
		[h2 setNumberOfShares : 200];

		BNRStockHolding *h3 = [[BNRStockHolding alloc] init];
		[h3 setPruchaseSharePrice : 0.88];
		[h3 setCurrentSharePrice : 0.23];
		[h3 setNumberOfShares : 10000];

		NSMutableArray *array = [NSMutableArray array];
		[array addObject:h1];
		[array addObject:h2];
		[array addObject:h3];

		for(BNRStockHolding * sh in array )
		{
			NSLog(@"%.2f , %.2f" , [sh costInDollars], [sh valueInDollars]); 
		}

	}
	return 0;
}
