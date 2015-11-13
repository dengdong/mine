#import <Foundation/Foundation.h>
@class BNREmployee;

@interface BNRAsset:NSObject

@property (nonatomic , copy) NSString *label;
@property (nonatomic) unsigned int resaleValue; 
@property (nonatomic,weak) BNREmployee *holder;


@end