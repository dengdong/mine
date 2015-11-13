#import <Foundation/Foundation.h>

@interface BNRPerson:NSObject

//定义两个属性
@property (nonatomic) float heightInMeters;
@property (nonatomic) int weightInKilos;


//
-(float) bodyMassIndex;

@end