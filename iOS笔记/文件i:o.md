##文件I/O

###1.使用NSData与NSMutableData
代表OC的数据缓冲区，主要作用：对数据读取NSData；输出NSData的数据。

主要方法:

* `data`
* `dataWithBytes:length/initWithBytes:length`
* `dataWithBytesNoCopy:length/initWithBytesNoCopy:length`
* `dataWithContentsOfFile:/initWithContentsOfFile`
* `dataWithContentsOfURL:/initWithContentsOfUrl:`
* `dataWithData:/initWithData:`

* `bytes`
* `getBytes:length`
* `getBytes:range:`
* `subdataWithRange:`
* `writeToFile:atomically`
* `writeToURL:atomically:`

示例：

```
		NSData* data = [NSData dataWithContentsOfURL:
			[NSURL URLWithString:@"http://www.baidu.com"]];
		NSLog(@"%ld",[data length]);
		char buffer[100];
		[data getBytes:buffer range :NSMakeRange(103,100)];
		NSLog(@"%s",buffer);
		NSString* content = [[NSString alloc ] initWithData:data 
			encoding:NSUTF8StringEncoding];
		NSLog(@"---网页内容");
		NSLog(@"%@",content);
```

###2.使用NSFileManager管理文件和目录
