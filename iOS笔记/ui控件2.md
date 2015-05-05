
##1.开关控件
UISwitch控件代表一个开关按钮，用于处理布尔值。可通过监控`ValueChange`事件来检测开关按钮的状态切换，也可通过属性`on`或实例方法`isOn`来获取当前值。

#####示例：通过switch开关来控制背景颜色

```
- (IBAction)backChange:(UISwitch *)sender {
    if ([sender isOn]) {
        [self.view setBackgroundColor:[UIColor whiteColor]];
        
    }
    else
    {
        [self.view setBackgroundColor:[UIColor blackColor]];
    }
}

```


##2.分段控件(UISegmentedControl)
分段控件提供一栏按钮，每次只能激活其中一个按钮。常用语在不同类别的信息之间选择，或在不同的屏幕之间切换。

支持的属性：

1. Style  设置控件的风格
2. State  设置控件不保持状态
3. Tint   设置被选中分段的高亮颜色
4. Segments 设置控件的分段数
5. Segment  选择某个分段
6. Title	选择分段的标题
7. Image	选择分段的图片
8. Behavior
	Enabled： 设置控件是否可用
	Selected：设置是否被选中
	
#####实例： 分段控件设置背景颜色，动态增加、删除分段
效果图：

<image src="http://images.cnblogs.com/cnblogs_com/dong-deng/685410/o_QQ20150501-1@2x.png" />

主要实现代码：

```
- (IBAction)segmentChanged:(UISegmentedControl *)sender {
    switch ([sender selectedSegmentIndex]) {
        case 0:
            [self.view setBackgroundColor:[UIColor redColor]];
            break;
             case 1:
            [self.view setBackgroundColor:[UIColor greenColor]];
             break;
             case 2:
            [self.view setBackgroundColor:[UIColor blueColor]];
             break;
             case 3:
            [self.view setBackgroundColor:[UIColor purpleColor]];
             break;
            
        default:
            break;
    }
}
- (IBAction)add:(UIButton *)sender {
    NSUInteger count = self.seg1.numberOfSegments;
    NSString*  title = self.tv.text;
    if([title length] > 0)
    {
        [self.seg1 insertSegmentWithTitle:title atIndex:count animated:YES];
    }
    
}

- (IBAction)remove:(UIButton *)sender {
    NSUInteger count = self.seg1.numberOfSegments;
    [self.seg1 removeSegmentAtIndex:count-1 animated:YES];
}
```

##3.图像控件(UIImageView)
代表一个图片显示控件，直接继承UIView，没有继承UIControl。

可以通过如下两个属性访问或设置控件显示的图片：

* `image:` 访问或设置该控件显示的图片
* `highlightedImage` 访问或设置该控件处于高亮状态时显示的图片

还可以使用动画显示一组图片，主要属性和方法如下：

* `animationImages：` 访问或设置该UIImageView需要动画显示的多张图片。NSArray
* `highlightedAnimationImages:` 访问或设置该UIImageView 高亮状态下需要动画显示的多张图片。该属性是一个NSArray对象。
* `animationDuratin:` 访问或设置 动画持续时间
* `animationRepeatCount:` 访问或设置动画持续次数
* `startAnimating:` 开始播放动画
* `isAnimating:` 该方法判断该UIImageView是否播放动画


#####实例： 图片浏览器及“幻灯片”播放器
效果图：

<img src="http://images.cnblogs.com/cnblogs_com/dong-deng/685410/o_QQ20150501-2@2x.png" height="400px" />

```
NSArray * images;
NSArray * images1;
int curImage;
CGFloat alpha;
-(void) viewDidLoad
{
    [super viewDidLoad];
    curImage = 0;
    alpha = 1.0;
    images = [NSArray arrayWithObjects:@"1.jpg",@"2.jpg",@"3.jpg" ,@"4.jpg",nil];
    //启动iv1控件的用户交互，从而允许该控件能响应用户手势
    self.iv1.userInteractionEnabled = YES;
    //创建一个轻击的手势检测器
    UITapGestureRecognizer * singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clicked:)];
    //为控件添加手势
    [self.iv1 addGestureRecognizer:singleTap];
    
    /*
     *幻灯片播放
     */
    self.iv3.animationImages=[NSArray arrayWithObjects:
                             [UIImage imageNamed:@"1.jpg"],
                             [UIImage imageNamed:@"2.jpg"],
                             [UIImage imageNamed:@"3.jpg"],
                             [UIImage imageNamed:@"4.jpg"],nil ];
    
    //设置动画总时间
    self.iv3.animationDuration=1.0;
    
    //设置重复次数，0表示不重复
    self.iv3.animationRepeatCount=0;
    
    //开始动画
    [self.iv3 startAnimating];
    
}

- (IBAction)plus:(UIButton *)sender {
    alpha += 0.2;
    if(alpha >= 1.0)
    {
        alpha = 1.0;
    }
    self.iv1.alpha = alpha;
}

- (IBAction)minus:(UIButton *)sender {
    alpha -= 0.2;
    if(alpha <= 0.0)
    {
        alpha = 0.0;
    }
    self.iv1.alpha = alpha;
}

- (IBAction)next:(UIButton *)sender {
    self.iv1.image = [UIImage imageNamed:[images objectAtIndex:(++curImage % images.count)]];
}
-(void) clicked:(UIGestureRecognizer*)getureRecognizer
{
    //获取正在显示的原始图片
    UIImage * srcImage = self.iv1.image;
    //获取用户手指在iv1控件上的触碰点
    CGPoint pt = [getureRecognizer locationInView:self.iv1];
    //获取正在显示的原图对应的CGImageRef
    CGImageRef sourceImageRef = [srcImage CGImage];
    //获取图片实际大小与第一个UIImageView的缩放比例
    CGFloat scale = srcImage.size.width / 320;
    //将iv控件上的触碰点的左边换算成原始图片上的位置
    CGFloat x = pt.x * scale;
    CGFloat y = pt.y * scale;
    if(x + 120 > srcImage.size.width)
    {
        x = srcImage.size.width -140;
    }
    if(y+ 120 > srcImage.size.height)
    {
        y = srcImage.size.height - 140;
    }
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, CGRectMake(x,y, 140, 140));
    self.iv2.image = [UIImage imageWithCGImage:newImageRef];
}
```


##4. 进度条
包括UIProgressView和UIActivityIndicatorView，前者显示 百分比，后者显示衣蛾旋转的齿轮。
###4.1 UIProgressView
UIProgressView继承UIView。

支持的主要属性：
1. Style
2. Progress     设置进度条任务的完成比例，0.0-0.1之间。
3. Progress Tint 设置已经完成进度的颜色。
4. Track Tint  设置进度条的轨道颜色
5. progressImage：
6. trackImage：


###4.2 UIActivityIndicatorView
表示任务正在进行中，该控件显示一个旋转的进度换，不精确显示百分比。

支持的属性：

1. Style
2. Color
3. Behavior
	* Animating: 勾选控制进度环显示出来后立即开始转动
	* Hides When Stopped: 设置进度换停止转动时自动隐藏
	
方法：

1. -startAnimating: 控制进度环开始转动
2. -stopAnimating:  控制进度环停止转动


##5. 拖动条(UISlider)

UISlider支持的属性与UIProgressBar相似。UISlider支持高度定制，包括定制拖动条的轨道、以完成精度的外观。

1. `setMinimumTrackImage:forState:` 设置拖动条已完成进度的轨道图片
2. `setMaximumTrackImage:forState:` 设置拖动条外完成进度轨道图片
3. `setThumbImage:forState:` 设置拖动条上滑块的图片























