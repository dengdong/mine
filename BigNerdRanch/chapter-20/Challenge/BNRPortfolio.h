#import <Foundation/Foundation.h>
@class BNRStockHolding;

@interface BNRPortfolio:NSObject
//{
//	NSMutableArray *_holdings;
//}
//@property (nonatomic,copy) NSArray *holdings;

-(void)addStock:(BNRStockHolding*) h ;
-(void)removeStock:(BNRStockHolding*)h ;
-(float) totalValue;

@end