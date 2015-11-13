#import <Foundation/Foundation.h>


int main(int argc, char const *argv[])
{
	@autoreleasepool{
		NSMutableString *str = [[NSMutableString alloc] init];
		for (int i = 0; i < 10; ++i)
		{
			[str appendString:@"aaron is cool!\n"];
		}

		//声明一个指向NSError对象的指针，但是不创建相应的对象
		//实际上，只有当发生错误时，才会有writeToFile创建相应的NSError对象
		NSError *error;

		//[str writeToFile:@"test.txt" atomically:YES encoding:NSUTF8StringEncoding error:NULL];
		BOOL success = [str writeToFile:@"test.txt" atomically:YES encoding:NSUTF8StringEncoding error:&error];

		if(success)
		{
			NSLog(@"done writing test.txt");
		}
		else
		{
			NSLog(@"write test.txt failed:%@",[error localizedDescription]);
		}


	}
	return 0;
}