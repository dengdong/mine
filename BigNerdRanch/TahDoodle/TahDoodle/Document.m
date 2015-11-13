//
//  Document.m
//  TahDoodle
//
//  Created by adminstrator on 15/10/14.
//  Copyright (c) 2015年 ddd.cc. All rights reserved.
//

#import "Document.h"

@interface Document ()

@end

@implementation Document

#pragma  mark -NSDocument Overrides

- (instancetype)init {
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
    }
    return self;
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController {
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

+ (BOOL)autosavesInPlace {
    return YES;
}

- (NSString *)windowNibName {
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    //[NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    
    //保存文档时调用
    //应该返回一个NSData对象，其中包含要保存的数据
    //如果数组对象还不存在，就先使用空数组
    if (!self.tasks) {
        self.tasks = [NSMutableArray array];
    }
    //将task数组转换成NSData对象
    NSData *data = [NSPropertyListSerialization dataWithPropertyList:self.tasks format:NSPropertyListXMLFormat_v1_0 options:0 error:outError];
    return data;
    return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
    // You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    // If you override either of these, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
    //[NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    //载入文档时使用
    //需要通过传入的NSData对象得到所需的数组
    //将NSData对象转会tasks数组
    self.tasks = [NSPropertyListSerialization
                  propertyListWithData:data options:NSPropertyListXMLFormat_v1_0 format:NULL error:outError];
    
    return (self.tasks!=nil);
}

#pragma mark -Actions

- (void) addTask:(id)sender
{
    //NSLog(@"Add Task Button clicked;");
    
    if (!self.tasks) {
        self.tasks = [NSMutableArray array];
    }
    [self.tasks addObject:@"New Item"];
    
    [self.taskTable reloadData];
    [self updateChangeCount:NSChangeDone];
}

#pragma mark 数据源方法

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [self.tasks count];
}

-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    NSString * str = [self.tasks objectAtIndex:row];
    return str;
}

-(void)tableView:(NSTableView *)tableView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    [self.tasks replaceObjectAtIndex:row withObject:object];
    [self updateChangeCount:NSChangeDone];
}

@end
