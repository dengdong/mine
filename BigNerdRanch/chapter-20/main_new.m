#import <Foundation/Foundation.h>
#import "BNREmployee.h"
#import "BNRAsset.h"


int main(int argc, char const *argv[])
{
	@autoreleasepool{
		NSMutableArray *employees = [[NSMutableArray alloc] init];
		NSMutableDictionary *executives = [[NSMutableDictionary alloc] init];

		for (int i = 0; i < 10; ++i)
		{
			BNREmployee *mikey =[[BNREmployee alloc] init];

			mikey.weightInKilos = 90+i;
			mikey.heightInMeters = 1.8- i/10.0;

			mikey.employeeID = i;

			[employees addObject:mikey];

			if (i == 0)
			{
				[executives setObject:mikey forKey:@"CEO"];
			}
			if (i==1)
			{
				[executives setObject:mikey forKey:@"CTO"];
			}
		}

		NSMutableArray *allAssets = [[NSMutableArray alloc] init];
		for (int i = 0; i < 10; ++i)
		{
			BNRAsset *asset = [[BNRAsset alloc] init];

			NSString *currentLabel = [NSString stringWithFormat:@"laptop %d",i];
			asset.label = currentLabel;
			asset.resaleValue = 350 + i*17;

			NSUInteger randomIndex = random() %[employees count];

			BNREmployee *randomEmployee = [employees objectAtIndex:randomIndex];

			[randomEmployee addAsset:asset];
			[allAssets addObject:asset];
		}

		//数组排序
		NSSortDescriptor * voa = [NSSortDescriptor sortDescriptorWithKey:@"valueOfAssets"  ascending:YES];
		NSSortDescriptor *eid = [NSSortDescriptor sortDescriptorWithKey:@"employeeID" ascending:YES ];
		[employees sortUsingDescriptors:@[voa,eid]];

		//数组筛选
		NSPredicate *predicate = [NSPredicate predicateWithFormat:@"holder.valueOfAssets > 70"];
		NSArray *toBeReclaimed = [allAssets filteredArrayUsingPredicate:predicate];
		NSLog(@"toBeReclaimed %@",toBeReclaimed);
		toBeReclaimed = nil;

		//输出整个NSMutableDictionary对象
		NSLog(@"executives : %@", executives);

		NSLog(@"CEO : %@", executives[@"CEO"]);

		executives = nil;

		NSLog(@"Employees:%@", employees);

		NSLog(@"Giving up ownership of one employee");

		[employees removeObjectAtIndex:5];
		NSLog(@"Giving up ownership of arrays");

		NSLog(@"AllAssets %@",allAssets);

		allAssets = nil;
		employees = nil;
	}
	sleep(100);
	return 0;
}