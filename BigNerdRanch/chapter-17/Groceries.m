#import <Foundation/Foundation.h>


int main(int argc, char const *argv[])
{
	@autoreleasepool{
		NSMutableArray *shoppingList = [NSMutableArray array];
		[shoppingList addObject:@"一块面包"];
		[shoppingList addObject:@"一瓶牛奶"];
		[shoppingList addObject:@"一片黄油"];

		NSLog(@"我的购物清单是：");
		for(NSString *str in shoppingList)
		{
			NSLog(@"%@", str);
		}
	}
	return 0;
}