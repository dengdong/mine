#import <Foundation/Foundation.h>


typedef void (^ArrayEnumerationBlock)(id,NSUInteger,BOOL *);

int main(int argc, char const *argv[])
{
	@autoreleasepool{
		//创建两个数组对象，分别用于保存最初的字符串对象和去除元音字母后的版本
		NSArray *originalString = @[@"Sauerkraut",@"Raygun",@"Big Nerd Ranch",@"Mississippi"];
		NSLog(@"original strings:%@",originalString);

		NSMutableArray *devowelizedStrings = [NSMutableArray array];

		//创建数组对象，保存需要从字符串中移除的字符
		NSArray *vowels = @[@"a",@"e",@"i",@"o",@"u"];

		//声明BLock变量
		//void (^devowelizer)(id , NSUInteger, BOOL *);
		ArrayEnumerationBlock devowelizer;
		
		//将BLock对象赋给变量
		devowelizer = ^(id string, NSUInteger i,BOOL *stop){

			NSRange yRnage = [string rangeOfString:@"y" options:NSCaseInsensitiveSearch];

			//是否包含字符‘y’
			if(yRnage.location  != NSNotFound)
			{
				*stop = YES;//执行完当前的Block对象后终止枚举国产
				return ;//结束当前正在执行的Block对象
			}

			NSMutableString  *newString = [NSMutableString  stringWithString:string];

			for(NSString *s in vowels){
				NSRange fullRange = NSMakeRange(0,[newString length]);
				[newString replaceOccurrencesOfString:s withString:@"" options:NSCaseInsensitiveSearch range:fullRange];
			}
			[devowelizedStrings addObject:newString];
		};//Block变量赋值结束

		[originalString enumerateObjectsUsingBlock:devowelizer];
		NSLog(@"new strings:%@", devowelizedStrings);
	}
	return 0;
}