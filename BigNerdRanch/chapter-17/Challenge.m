#import <Foundation/Foundation.h>

int main(int argc, char const *argv[])
{
	@autoreleasepool{
		NSString *nameString = [[NSString stringWithContentsOfFile:@"/usr/share/dict/words"
										 encoding:NSUTF8StringEncoding
										 error:NULL] lowercaseString];
		//NSLog(@"%@", nameString);

		NSArray *words = [nameString componentsSeparatedByString:@"\n"];
		//NSLog(@"%lu", [words count]);

		NSMutableArray *list = [NSMutableArray array];
		NSUInteger count  = [words count];
		for (int i = 0; i < count; ++i)
		{
			NSString *word = [words objectAtIndex:i];
			NSRange range = NSMakeRange(i+1, count -i-1) ;
			//range.location = i+1;
			//range.length = count-i-1;
			//NSLog(@"%@", NSStringFromRange(range));
			NSUInteger index = [words indexOfObject:word inRange:range];
			if (index != NSNotFound)
			{
				NSLog(@"%d--%@--%lu",i, word, index);

				[list addObject:word];
			}
		}
	}
	return 0;
}