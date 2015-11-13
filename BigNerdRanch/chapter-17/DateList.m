#import <Foundation/Foundation.h>

int main(int argc, char const *argv[])
{
	@autoreleasepool{
		//创建3个NSDate对象
		NSDate *now = [NSDate date];
		NSDate *tomorrow = [now dateByAddingTimeInterval:24.0*60*60];
		NSDate *yesterday = [now dateByAddingTimeInterval:-24.0 * 60.0 * 60.0];

		//创建一个数组包含这三个NSDate对象
		NSArray *datelist = @[now, tomorrow , yesterday];

		//输出其中的两个对象
		NSLog(@"The first date is %@",datelist[0]);
		NSLog(@"The third date is %@", datelist[1]);

		//包含多少个对象
		NSLog(@"There are %lu dates", [datelist count]); 

		//遍历数组
		NSUInteger dateCount = [datelist count];
		for (int i = 0; i < dateCount ; ++i)
		 {
		 	NSDate *d = datelist[i];
		 	NSLog(@"Here is a date:%@", d);
		 } 


		 //快速枚举
		 for(NSDate *d in datelist)
		 {
		 	NSLog(@"Here is a date:%@",d);
		 }
		 NSLog(@"\n");

		 /*  
		  *NSMutableArray
		 */
		 NSMutableArray * mDateList = [NSMutableArray array];
		 //将两个NSDate对象加入新创建的数组
		 [mDateList addObject:now];
		 [mDateList addObject:tomorrow];

		 //将yesterday指针插入数组的起始位置
		 [mDateList insertObject:yesterday atIndex:0];

		 //遍历数组
		 for(NSDate *d  in mDateList)
		 {
		 	NSLog(@"Here is a date:%@", d);
		 }

		 //删除yesterday指针
		 [mDateList removeObjectAtIndex:0];
		 NSLog(@"Now the first date is %@",mDateList[0]);

	}
	return 0;
}