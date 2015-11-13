#import <Foundation/Foundation.h>

@interface BNRPerson :NSObject 
{
	float _heightInMeters;
	int _weightInKilos;
}

- (float)heightInMeters;
- (void)setHeightInMeters:(float)h;
- (int)weightInKilos;
- (void)setWeightInKilos:(int)w;

-(float)bodyMassIndex;

@end