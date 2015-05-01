
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

























