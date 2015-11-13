//
//  Document.h
//  TahDoodle
//
//  Created by adminstrator on 15/10/14.
//  Copyright (c) 2015年 ddd.cc. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Document : NSDocument <NSTableViewDataSource>



@property (nonatomic) NSMutableArray *tasks;
@property (nonatomic) IBOutlet NSTableView *taskTable;

- (IBAction)addTask:(id)sender;


@end

