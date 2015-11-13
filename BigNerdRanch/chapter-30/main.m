#import <Foundation/Foundation.h>

int main(int argc, char const *argv[])
{
	@autoreleasepool{

		NSMutableArray *stocks = [[NSMutableArray alloc] init];

		NSMutableDictionary *stock ;

		stock = [NSMutableDictionary dictionary];
		[stock setObject:@"AAPL" forKey:@"symbol"];
		[stock setObject:[NSNumber numberWithInt:200] forKey:@"shares"];
		[stocks addObject:stock];

		stock = [NSMutableDictionary dictionary];
		[stock setObject:@"GOOG" forKey:@"symbol"];
		[stock setObject:[NSNumber numberWithInt:160] forKey:@"shares"];
		[stocks addObject:stock];
		//写入plist文件
		[stocks writeToFile:@"stocks.plist" atomically:YES];

		//读取plist
		NSArray *stockList = [NSArray arrayWithContentsOfFile:@"stocks.plist"];

		for(NSDictionary *d in stockList)
		{
			NSLog(@"I have %@ shares of %@", [d objectForKey:@"shares"],[d objectForKey:@"symbol"]);
		}

		NSMutableArray *testArr = [NSMutableArray array];
		[testArr addObject:@[@"a",@1,@"b"]];
		[testArr addObject:@356];
		[testArr addObject:@"asdf"];
		[testArr addObject:[NSDate date]];
		[testArr addObject:@1.3];
		[testArr addObject:@YES];
		[testArr addObject:@010101];
		[testArr writeToFile:@"test.plist" atomically:YES];
	}
	return 0;
}