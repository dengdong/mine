##1.字符串
OC由两个字符串：NSString和NSMutableString,NSString代表字符序列不可变的字符串，而NSMutableString则代表字符序列可变的字符串。

###1.1 创建字符串
```
unichar data[6]={97,98,99,100,101,102};
		//使用Unicode数组初始化字符串
		NSString* str = [[NSString alloc] initWithCharacters:data length:6];
		NSLog(@"%@",str);
		//将C风格的字符串转换为NSString对象
		char * cstr = "Hello,iOS";
		NSString * str2 = [NSString stringWithUTF8String:cstr];
		NSLog(@"%@",str2);
		//将字符串写入指定文件
		[str2 writeToFile:@"myFile.txt"
			  atomically:YES
			  encoding:NSUTF8StringEncoding
			  error:nil];
		//读取文件内容，用文件内容初始化字符串
		NSString* str3 = [NSString stringWithContentsOfFile:@"myFile.txt"
			encoding:NSUTF8StringEncoding
			error:nil];
		NSLog(@"%@",str3);
```

###1.2 NSString的常用功能
```
		NSString* str = @"Hello";
		NSString* book =@"速度与激情";
		//获取字符串对应的C风格字符串
		const char* cstr = [str UTF8String];
		NSLog(@"获取的C字符串%s",cstr);

		str = [str stringByAppendingFormat:@"%@是一部不错的电影.",book];
		NSLog(@"%@",str);
		NSLog(@"%lu",[str length]);
		NSLog(@"str按UTF8字符集解码后字节数:%lu",[
			str lengthOfBytesUsingEncoding:NSUTF8StringEncoding
			]);
		//获取str的前10个字符租场的字符串
		NSString* s1 =[str substringToIndex:10];
		NSLog(@"%@",s1);
		NSString* s2 = [str substringFromIndex:5];
		NSLog(@"%@",s2);
		NSString * s3 = [str substringWithRange:NSMakeRange(5,10)];
		NSLog(@"%@",s3);
		NSRange pos = [str rangeOfString:@"电影"];
		NSLog(@"电影在str中出现的开始位置:%ld,长度为:%ld",pos.location,pos.length);
		str = [str uppercaseString];
		NSLog(@"%@",str);
```

##2.日期与实践
###2.1日期与实践(NSDate)
NSDate对象代表日期与实践，OC提供了类方法来创建NSDate对象，也提供了init开头的方法来初始化NSDate。

```
		//获取代表当前日期、时间的NSDate
		NSDate* date1 = [NSDate date];
		//创建从当前时间开始，一天之后的日期
		NSDate* date2=[[NSDate alloc] initWithTimeIntervalSinceNow:3600*24];
		//创建3天之前的日期
		NSDate* date3 =[[NSDate alloc] initWithTimeIntervalSinceNow:-3*3600*24];
		//获取1970年20年之后的日期
		NSDate* date4 =[NSDate dateWithTimeIntervalSince1970:3600*24*366*20];
		//获取系统当前的Locacle
		NSLocale* cn = [NSLocale currentLocale];
		//获取NSDate在当前Locale对应的字符串
		NSLog(@"%@",[date1 descriptionWithLocale:cn]);
		NSDate* earlier =[date1 earlierDate:date2];
		NSDate * later = [date2 laterDate:date2];

		switch([date1 compare:date3])
		{
			case NSOrderedSame:
				NSLog(@"date1位于date3之前");
				break;
			case NSOrderedAscending:
				NSLog(@"date1位于date3之前");
				break;
			case NSOrderedDescending:
				NSLog(@"date1位于date3之前");
				break;
		}
		NSLog(@"date1与date3之间差%g秒",[date1 timeIntervalSinceDate:date3]);
		NSLog(@"date2与现在的时间差%g秒",[date2 timeIntervalSinceNow]);
```

###2.2 日期格式化(NSDateFormatter)
NSDateFormatter代表一个日期格式器，用于NSDate和NSString之间的转换

调用NSDateFormatter的setDateStyle:、setTimeStyle方法设置格式化日期时间的风格，支持如下几个枚举值：

* NSDateFormatterNoStyle
* NSDateFormatterShortStyle
* NSDateFormatterMediumStyle
* NSDateFormMatterLongStyle
* NSDateFormmatterFullStyle

```
		NSDate* dt =[[NSDate alloc] init];
		NSDateFormatter* df2 = [[NSDateFormatter alloc] init];
		[df2 setDateFormat:@"yyyy-MM-dd HH:mm"];
		NSLog(@"%@",[df2 stringFromDate:dt]);
		NSString* dateStr=@"2013-03-02";
		NSDateFormatter* df3 = [[NSDateFormatter alloc] init];
		[df3 setDateFormat:@"yyyy-MM-dd"];
		NSDate* date2 = [df3 dateFromString:dateStr];
		NSLog(@"%@",date2);

		NSLocale* locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
		NSDateFormatter* df = [[NSDateFormatter alloc] init];
		[df setDateStyle:NSDateFormatterShortStyle];
		[df setTimeStyle:NSDateFormatterShortStyle];
		[df setLocale:locale];
		NSLog(@"%@",[df stringFromDate:dt]);
```

###2.3 日历(NSCalendar)和日期组件(NSDateComponents)
为了能分开处理NSDate对象所包含的各个字段的数据，Foundation框架提供了NSCalendar，两个常用的方法：

* `(NSDateComponents*)components:fromDate:` 从NSDate提取年、月、日、时分秒
* `dateFromComponents:(NSDateComponents*) comps` 

`NSDateComponents`用于封装各个时间段的信息，包含了year/month/date/day/hour/minute/senond/week/weekday 等各个字段的setter getter方法

###2.4 定时器(NSTimer)


##3.NSCopying与NSMutableCopy协议


##4.数组(NSArray与NSMutableArray)
NSArray代表元素有序、可重复的一个集合，每个元素都有对应的索引。

###4.1 NSArray的功能与用法
NSArray提供了类方法和实例方法来创建NSArray，类方法以array开始，实例方法以init开头。

* array 创建一个不包含任何元素的空NSArray
* arrayWithContentsOfFile:/initWithContentsOfFile: 读取文件来创建NSArray
* arrayWithObject:/initWithObject: 创建只包含指定元素的NSArray
* arrayWithObjects:/initWithObjects: 创建包含指定的N个元素的NSarray 

NSArray中大量需要判断指定元素位于NSArray集合中的索引，只要某个集合元素与被查找元素通过`isEqual:`方法比较返回YES，即可认为该NSArray集合包含该元素，并不需要两个元素是同一个元素。

```
//重写isEqual:方法
-(BOOL) isEqual:(id)other
{
	if(self == other)
	{
		return YES;
	}
	else([other class] == self.class);
	{
		FKUser* target = (FKUser*)other;
		return [self.name isEqualToString:target.name]
			&& [self.pass isEqualToString:target.pass];
	}
	return NO;
}
```

###4.2对集合元素整体调用方法

如果只是简单调用集合元素的方法，可以通过NSArray的如下两种方法

* `makeObjectsPerformSelector:`  依次调用NSArray集合中每个元素的指定方法，该方法需要传入一个SEL参数，用于指定调用那种方法。
* `makeObjectsPerformSelector:withObject:` 第二个参数用于调用集合元素的方法是传入参数，第三个参数用于控制是否终止迭代。

如果希望对集合中的所有元素进行隐式遍历，并使用集合元素来执行某一段代码，可用NSArray如下方法：

* `enumerateObjectsUsingBlock`  遍历集合中的所有元素，并一次使用元素来执行指定的代码块
* `enumerateObjectsWithOptions:usingBlock:`  遍历集合中的所有元素，并一次使用元素来执行指定的代码块。该方法可以额外传入一个参数，用于控制遍历 的选项
* `enumerateObjectsAtIndexes:options:usingBlcok:`  遍历集合中指定范围内的元素，并一次使用元素来执行指定的代码块。可传入一个选项参数
* 

```
//对集合元素整体调用方法
			[array makeObjectsPerformSelector:@selector(say:) withObject:@"下午好，NSArray"];

			NSString* content = @"Hello,iOS";
			[array enumerateObjectsAtIndexes:
				[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(2,2)]
				options:NSEnumerationReverse
				//代码块第一个参数表示正在遍历的集合元素，第二个参数表示正在遍历的集合元素的索引
				usingBlock:^(id obj,NSUInteger idx,BOOL *stop)
				{
					NSLog(@"正在处理第%ld个元素：%@",idx,obj);
					[obj say:content];
				}];
```

###4.3 NSArray 排序
NSArray提供了大量的方法对集合进行排序，以sort 开头，常用的如下：

* `sortedArrayUsingFunction:context:` 使用排序函数对集合元素进行排序，函数返回 NSOrderedDescending/NSOrderedAscending/NSOrderedSame 枚举值
* `sortedArrayUsingSelector:` 使用集合元素自身的方法对集合进行排序
* `sortedArrayUsingComparator:` 使用代码块对函数进行排序，

###4.4 使用枚举器遍历NSArray集合元素
调用NSArray的如下两个方法来返回枚举器：

* `objectEnumerator:` 返回NSArray集合的顺序枚举器
* `reverseObjectEnumerator:` 返回NSArray集合的逆序枚举器
返回一个NSEnumerator枚举器，包含如下2个方法：

* `allObjects:` 获取被枚举集合中的所有元素
* `nextObject`  获取被枚举集合的下一个元素

###4.5 快速枚举(for...in)
快速枚举的语法：

```
for(type variableName in collection)
{
	//variableName自动迭代每个元素
}
```

###4.6 可变数组(NSMutableArray)
NSArray代表集合元素不可变的集合。NSMutableArray是NSArray的子类，代表集合元素可变的集合，可以添加、删除、替换集合元素。

NSMutableArray新增了如下方法。

* 添加集合元素的方法，以add开头
* 删除集合元素的方法，以remove开头
* 替换集合元素的方法，以replace开头
* 对集合本身排序的方法，以sort开头

###4.7 NSArray的KVC、KVO
NSArray允许直接对集合中的所有元素进行整体的KVC编码：

* `setValue: forKey:` 将集合中所有元素的制定key对应属性或实例变量设置为value
* `valueForKey:`返回该集合中所有元素的指定key组成的NSArray对象。

NSArray为所有元素或部分元素进行KVO编程提供了如下方法：

* `addObserver: forKeyPath: options: context:` 为集合中所有元素添加KVO监听器
* `removeObserver:forKeyPath:` 为集合中所有元素删除KVO监听器
* `removeObserver:fromObjectsAtIndexes:forKeyPath:`  为集合中指定索引出的元素删除KVO监听器

##5.集合(NSSet/NSMutableSet)
NSSet集合不允许包含相同的元素，如果试图把2个相同的元素放在同一个NSSet里，则只会保留同一个元素。
###5.1 NSSet的功能与用法
NSSet包含如下常用方法：

* `setByAddingObject:` 向集合添加一个新元素，返回添加元素后的新集合
* `setByAddingObjectsFromSet:` 使用NSSet集合想集合中添加多个新元素
* `setByAddingObjectsFromArray:`使用NSArray集合向集合中添加多个新元素
* `allObjects:` 返回集合中所有元素组成的NSArray
* `anyObject:` 返回该集合中的某个元素
* `containsObject` 判断集合是否包含指定元素
* `member` 判断该集合是否包含与参数相等的元素，
* `objectsPassingTest` 需要传入一个代码块对集合进行过滤
* `objectsWithOptions:passingTest` 	
* `isSubSetOfSet:`判断当前NSSet集合是否为另一个集合的子集合
* `intersectsSet` 判断两个集合的元素是否有相同的元素，是否存在交集
* `isEqualToSet` 判断两个集合的元素是否相等

###5.2 NSSet判断集合元素重复
1. 两个对象通过isEqual:方法比较返回YES
2. 两个对象的hash方法返回值也相等

###5.3 NSMutableSet 

NSMutableSet继承NSSet，代表一个集合元素可变的NSSet集合，创建是可以指定底层Hash表的初始容量。

NSMutableSet增加了添加、删除元素的方法，增加了对集合计算交集、并集、差集的方法

* `addObject:`  添加单个元素
* `removeObject:` 删除单个元素
* `removeAllObject:`删除所有元素
* `addObjectsFromArray:`
* `unionSet:` 计算两个NSSet集合的并集
* `minusSet:` 差集
* `intersectSet:` 交集
* `setSet:` 用后一个集合的元素替换已有集合中的所有元素

###5.4 NSCountedSet
NSCountedSet是NSMutableSet的子类，为每个元素维护一个添加次数的状态。添加集合以存在的元素，添加次数加1.删除一个元素时，删除一次添加次数减1，当添加次数变位0，才会真正从集合删除。

`countForObject:` 获取指定元素的添加次数。


##6.有序集合（NSOrderedSet/NSMutableOrderedSet）

NSOrderedSet不允许重复，可以保持元素的添加顺序，每个元素都有索引，可以根据索引来操作元素。

##7.字典(NSDictionary与NSMutableDictionary)

NSDictionary用于保存具有映射关系的数据，NSDictionary集合保存着两组值，一组保存Key，一组保存value，key不允许重复。

###7.1 功能与用法
NSDictionary提供了类方法(以dictionary开始)和实例方法(以init开头)来创建NSDictionary。

* `dictionary:` 创建一个不包含任何key-value的NSDictionary
* `dictionaryWithContentsOfFile:/initWithContentsOFFile:` 读取指定文件的内容来初始化NSDictionary，该文件通常是由NSDictionary自己输出生成的。
* `dictionaryWithDictionary:/initWithDictionary` 使用已有的NSDictionary包含的key-value对来初始化
* `dictionaryWithObject:forKey:`使用单个key-value来创建NSDictionary
* `dictionaryWithObjects:forKeys:/initWithObjects:forKey:`使用2个NSArray分别指定key、value 集合
* `dictionaryWithObjectsAndKeys:/initWithObjectsAndKeys:` 调用该方法是，需要按value1,key1,value2,key2,...nil格式传入多个key-value对
#####常用方法
* `count` 
* `allKeys` 返回所有的key
* `allKeysForObject:` 返回指定value对应的全部key
* `allValues:` 返回所有的value
* `objectForKey:` 返回指定key对应的value
* `objectForKeyedSubscript:`	 通过该方法的支持，允许NSDictionary通过下表来获取指定key对应的value。
* `valueForKey:`   获取指定key对应的value
* `keyEnumerator:` 集合所有key的NSEnumerator对象
* `objectEnumerator:` 集合所有value的NSEnumerator对象
* `enumerateKeysAndObjectsUsingBlock:` 使用指定的代码块来迭代执行该集合中所有的key-value对
* `enumerateKeysAndObjectsWithOptions:usingBlock:` 使用代码块来迭代key-value，可传入一个额外的NSEnumeratorOptions参数
* `writeToFile:atomically:` 将集合写入文件

#####key排序
NSDictionary提供的排序方法如下：

* `keysSortedByValueUsingSelector:`
* `keysSortedByValueUsingComparator:`
* `keysSortedByValueWithOptions:usingComparator:`


#####key过滤

* `keysOfEntriesPassingTest:` 使用代码块迭代处理NSDictionary的key-value

```
NSSet* keySet = [dict keysOfEntriesPassingTest:
	^(id key,id value,BOOL* stop){
		//return 
	}];
```
* `keysOfEntriesWithOptions:passingTest:`


###7.2 NSMutableDictionary
NSMutableDictionary继承了NSDictionary，代表了一个key-value可变的NSDictionary.

新增的方法：

* `setObject:forKey:` 新增一个key-value对。如果key存在，则覆盖
* `setObject:forKeyedSubscript:` 通过该方法的支持，允许程序通过下标法来设置key-value
* `addEntriesFromDictionary:`将另一个NSDictionary所有的key-value复制到当前NSDictionary中
* `setDictionary:` 用另一个Dictionary替换掉当前Dictionary
* `removeObjectForKey:` 根据key来删除key-value
* `removeAllObjects:`   清空Dictionary
* `removeObjectsForKeys:` 多个key 组成的NSArray，同时 删除多个key-value


##8 谓词
NSPredicate用于定义一个逻辑条件，通过该条件可执行搜索或内存中的过滤操作。

###8.1 定义谓词
谓词由NSPredicate对象来代表，由三个子类 `NSComparisonPredicate`,`NSCompoundPredicate`,`NSExpression`,通常直接使用NSPredicate的 `predicateWithFormat:`方法，以谓词字符串为参数来创建NSPredicate对象

创建谓词后，如果谓词中没有占位符，可以使用NSPredicate的`evaluteWithObject:`方法计算谓词的结果，返回`BOOL`;如果谓词由占位符，需要经过两步：

 1. 调用谓词的	`predicateWithSubstiutionVariables:`方法为占位符参数设置参数值
 2. 执行谓词的`evaluateWithObject:`方法计算谓词的返回结果
 
 可以使用`evaluateWithObject:substitutionVariables:`方法，同时执行上面两步
 
 ```
 		NSPredicate* pred = [NSPredicate predicateWithFormat:@"name like 's*'"];
		FKUser* user1 = [[FKUser alloc] initWithName:@"sun" pass:@"555" ];
		BOOL b = [pred evaluateWithObject:user1];
 ```
 
 
###8.2使用谓词过滤集合
 
 谓词本身代表一个逻辑条件，计算谓词的结果就是返回`BOOL`类型的值。谓词对集合进行过滤，程序将会自动遍历集合元素，根据集合元素来计算谓词的值。<br />
 NSArray提供了如下方法使用谓词
 
 * `(NSArray*) filteredArrayUsingPredicate:(NSPredicate*)predicate:`
 
 NSMutableArray提供了如下方法使用谓词过滤集合：
 
 * `-(void)filterUsingPredicate:(NSPredicate*)predicate:`
 
 NSSet提供了如下方法：
 
 * `-(NSSet*) filteredSetUsingPredicate:(NSPredicate*) predicate:`
 
 NSMutableSet：
 
 * `-(void) filterUsingPredicate:(NSPredicate*) predicate:` 
 


###8.3使用占位符
谓词表达式支持两个占位符参数：

1. `%K` 用于动态传入属性名
2. `%@` 用户动态设置属性值

示例片段

```
		NSString * propPath = @"name";
		NSString* value =@"x";
		//创建谓词，包含两个占位符
		NSPredicate* pred = [NSPredicate predicateWithFormat:
			@"%K contains %@",propPath,value];
		NSSet* newset = [set filteredSetUsingPredicate:pred];
		NSLog(@"%@",newset);
		
		NSPredicate * preTemplate = [NSPredicate predicateWithFormat:
			@"%K CONTAINS $SUBSTR",@"pass"];

		NSPredicate* pred1 = [preTemplate 
			predicateWithSubstitutionVariables:
				[NSDictionary dictionaryWithObjectsAndKeys:@"aa",@"SUBSTR",nil]
			];
		NSSet* newset1 = [set filteredSetUsingPredicate:pred1];
		NSLog(@"%@",newset1);
```

#####谓词的表达式语法：
* 基本比较运算符
	+ =、==
	+ &lt;= =>
	+ <= =<
	+ &lt;
	+ < 
	+ != 、==
	+ BETWEEN   “express between {下限,上限}”
* 基本逻辑运算符
	+ AND     &amp;&amp;
	+ OR    ||
	+ NOT   !:
* 字符串比较
	+ BEGINSWITH
	+ ENDSWITH
	+ CONTAINS
	+ LIKE  可以使用*(任意多个字符)和？(一个字符)通配符 ，
	+ MATCHES
* 操作集合
 	+ ANY  SOME  有一个元素满足条件返回YES
 	+ ALL  全部满足条件返回YES
 	+ NONE 全部不满足返回YES
 	+ IN   ` name in {'a','b','c'}`
 	+ array[index]  索引出的元素
 	+ array[FIRST] 第一个元素
 	+ array[LAST]  返回数组最后一个元素
 	+ array[SIZE]  返回数组的个数
* 直接量
	+ FALSE/NO
	+ TRUE/YES
	+ NULL/NIL
	+ SELF
	+ 字符串 `'text' `
	+ 数组 `{'a','b','c'}`
	+ 数值
	+ 十六进制   0x开头
	+ 八进制  0o
	+ 二进制  0b
* 保留字



























