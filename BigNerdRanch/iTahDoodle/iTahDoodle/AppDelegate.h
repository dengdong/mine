//
//  AppDelegate.h
//  iTahDoodle
//
//  Created by adminstrator on 15/10/13.
//  Copyright (c) 2015年 ddd.cc. All rights reserved.
//

#import <UIKit/UIKit.h>

NSString *docPath(void);

@interface AppDelegate : UIResponder <UIApplicationDelegate , UITableViewDataSource>

@property (strong, nonatomic) UIWindow *window;


@property (nonatomic) UITableView *taskTable;
@property (nonatomic) UITextField *taskField;
@property (nonatomic) UIButton *insertButton;

@property (nonatomic) NSMutableArray *tasks;

@end

