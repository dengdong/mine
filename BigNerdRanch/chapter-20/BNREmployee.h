#import "BNRPerson.h"
@class BNRAsset;


@interface BNREmployee:BNRPerson
//{
//	NSMutableArray *_assets;
//}

@property (nonatomic) unsigned int employeeID;
//@property (nonatomic) unsigned int officeAlarmCode;
@property (nonatomic) NSDate *hireDate;


@property (nonatomic) NSString *lastName;
@property (nonatomic) BNRPerson *spouse;
@property (nonatomic) NSMutableArray *children;
@property (nonatomic,copy)NSSet *assets;

- (double)yearOfEmployment;
- (void) addAsset:(BNRAsset *)a;
- (unsigned int )valueOfAssets;

@end