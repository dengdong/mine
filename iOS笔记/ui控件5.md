
##1.微调器(UIStepper)
iOS5 新增UI，包含 `+`、`-`两个按钮,继承了UIControl

支持的属性：

1. Value 
    * Minimum
    * Maximum
    * Current
    * Step
2. Behavior
	* Autorepeat  按住 加号 不松手，数字会持续变化
	* Continuous  为YES时，用户交互会立即出发ValueChanged事件，NO 表示只有等用户交互结束才出发ValueChanged事件
	* Wrap 若为YES，value加到超过Maximum值时，会变成Min指。

设置自定义外观：
	
setDecrementImage:(UIImage*)image forState:

setIncrementImage:(UIImage*) image forState:

##2.网页控件(UIWebView)

常用属性：

1. `scalesPageToFit` 控制是否缩放网页以适应该空间
2. `dataDetectorTypes`  检测网页指定类型的数据：电话、超链接、地址

如下方法加载内容：

1. `-loadHTMLString:baseURL:` 加载并显示HTML字符串
2. `loadRequest:` 加载并显示指定URL对应网页
3. `stringByEvaluatingJavaScriptFromString` 执行指定的Javascript字符串并返回执行结果

控制导航方法：

1. `-goBack:` 后退
2. `-goForward:` 前进
3. `-reload:` 重新加载网页
4. `-stopLoading` 停止加载

UIWebView 的委托`UIWebViewDelegate`，包含方法：

1. `-webView:shouldStartLoadWithRequest:navigationType:`开始装载指定URL对应的网页时出发
2. `-webViewDisStartLoad:` 开始装载时出发
3. `-webViewDiFinishLoad:` 完成装载时出发
4. `-webView:didFailLoadWithError:` 装载响应出现错误触发

##3. 工具条(UIToolbar)
UIToolbar继承UIView，通常作为多个UIBarButtonItem的容器，每个UIBarButtonItem代表工具条上的一个控件。

UIToolbar支持的属性：
* barStyle 工具条的风格
* items， NSArray对象，包含多个BarButtonItem对象

UIToolbar上可以放任何控件，只要把控件包装成UiBarButtonItem.
UIBarButtonItem的初始化方法：

* `- initWithTitle:style:target:action:`初始化包装一个普通按钮
* `-initWithImage:style:target:action:`包装UIImageView
* `-initWithBarButtonSystemItem:target:action:` 初始化包装系统按钮的UIBarButtonItem
* `-initWithCustomView:`初始化包装任意UI控件


#####自定义工具条

```

UIProgressView* prog;
NSTimer* tbTimer;

-(void) viewDidLoad
{
    [super viewDidLoad];
    //创建工具条
    UIToolbar * toolbar = [[UIToolbar alloc]
                           initWithFrame:CGRectMake(0, 0, 320, 44)];
    [self.view addSubview:toolbar];
    
    //创建文本标题的UIBarButtonItem
    UIBarButtonItem * bn1 = [[UIBarButtonItem alloc]
                             initWithTitle:@"OK" style:UIBarButtonItemStylePlain target:self action:@selector(clicked:)];
    //创建使用自定义图片的UIBarButtonItem
    UIBarButtonItem * bn2 = [[UIBarButtonItem alloc]
                             initWithImage:[UIImage imageNamed:@"lyf.jpg"] style:UIBarButtonItemStyleBordered target:self action:@selector(clicked:)];
    //创建使用系统图标的UIBarButtonItem
    UIBarButtonItem * bn3 = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(clicked:)];
    //创建一个可伸缩的UIBarbuttonItem
    UIBarButtonItem * flexItem = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    prog = [[UIProgressView alloc]
            initWithProgressViewStyle:UIProgressViewStyleBar];
    prog.frame = CGRectMake(0,0, 80, 20);
    prog.progress = 0;
    UIBarButtonItem * bn4 = [[UIBarButtonItem alloc]
                             initWithCustomView:prog
                             ];
    toolbar.items = [NSArray arrayWithObjects:bn1,bn2,bn3,flexItem,bn4, nil];
    
    tbTimer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(changeProgress) userInfo:nil repeats:YES];
    
}
-(void)clicked:(id)sender
{
    NSLog(@"%@",sender);
}
-(void) changeProgress
{
    if(prog.progress >=1.0)
    {
        [tbTimer invalidate];
    }
    else
    {
        [prog setProgress:prog.progress + 0.05 animated:YES];
    }
}
```