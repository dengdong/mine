//
//  AppDelegate.m
//  iTahDoodle
//
//  Created by adminstrator on 15/10/13.
//  Copyright (c) 2015年 ddd.cc. All rights reserved.
//

#import "AppDelegate.h"

//辅助函数，返回保存用户任务数组的文件路径

NSString *docPath()
{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    return [path[0] stringByAppendingPathComponent:@"data.td"];
}


@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma  mark 应用委托对象的回调方法

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    //创建一个空的NSMutableArray
    //self.tasks = [NSMutableArray array];
    
    //读取已有的任务数据或创建一个新的
    NSArray *plist = [NSArray arrayWithContentsOfFile:docPath()];
    if (plist) {
        self.tasks = [plist mutableCopy];
    }
    else
    {
        self.tasks = [NSMutableArray array];
    }
    
    //创建并设置UIWindow对象
    //CGRect是C结构，其下的两个成员也是C结构：origin(x,y) 和size(width,height)
    CGRect winFrame = [[UIScreen mainScreen] bounds];
    UIWindow *theWindow = [[UIWindow alloc] initWithFrame:winFrame];
    self.window = theWindow;
    
    //设置三个UI对象的frame属性
    //CGRectMake()函数可以创建CGRect结构，参数是(x,y,width,height)
    CGRect tableFrame = CGRectMake(0, 80, winFrame.size.width, winFrame.size.height-100);
    CGRect fieldFrame = CGRectMake(20, 40, 200, 31);
    CGRect buttonFrame=    CGRectMake(228, 40, 72, 31);
    
    //创建并设置UITableView对象
    self.taskTable = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    self.taskTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.taskTable.dataSource = self;
    
    //需要创建新的单元格时，告诉UITableView对象要实例化哪个类
    [self.taskTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    //创建并设置UITextField对象，以便用户能够输入新任务创建并设置UIButton对象(类型是圆角按钮)，按下时将新任务输入UITableView对象
    self.taskField = [[UITextField alloc] initWithFrame:fieldFrame];
    self.taskField.borderStyle = UITextBorderStyleRoundedRect;
    self.taskField.placeholder=@"Type a task,tap Insert";
    
    //创建并设置UIButton对象
    self.insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.insertButton.frame = buttonFrame;
    
    //为按钮设置标题
    [self.insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    
    //设置Insert按钮的目标-动作对
    [self.insertButton addTarget:self action:@selector(addTask:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.window addSubview:self.taskField];
    [self.window addSubview:self.taskTable];
    [self.window addSubview:self.insertButton];
    
    //设置UIIWindow实例的背景颜色，并放上屏幕
    self.window.backgroundColor =[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}


#pragma mark - Actions

- (void) addTask:(id)sender
{
    //获取新任务的文字描述
    NSString *text = [self.taskField text];
    
    //如果taskField没有内容，就直接返回
    if ([text length] == 0) {
        return;
    }
    //将文本添加到控制器
    //NSLog(@"Task entered:%@", text);
    
    //将任务添加到tasks数组
    [self.tasks addObject:text];
    
    //刷新表格视图，显示新加入的任务
    [self.taskTable reloadData];
    
    //清空 taskField
    [self.taskField setText:@""];
    //关闭键盘
    [self.taskField resignFirstResponder];
}

#pragma mark - 管理表格视图

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //因为iTahDoodle中的表格视图只有一个表格段
    //所以可以直接忽略传入的表格段索引
    //直接返回任务数组所含对象的个数
    return [self.tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //为了提升性能，检查是否有可以重用的UITableViewCell对象。
    //没有可以重用的UiTableViewCell对象，创建新的
    UITableViewCell *cell = [self.taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    
    //根据模型对象，（重新）设置UITableViewCell对象
    NSString *item = [self.tasks objectAtIndex:indexPath.row];
    cell.textLabel.text = item;
    return cell;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [    self.tasks writeToFile:docPath() atomically:YES];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
