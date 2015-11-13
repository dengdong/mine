#import <Foundation/Foundation.h>

@interface BNRStockHolding:NSObject

@property float purchasePrice;
@property float currentPrice;
@property int numberOfShares;
@property (nonatomic) NSString *symbol;

-(float)costInDollars;
-(float)valueInDollars;

@end