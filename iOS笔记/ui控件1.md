
##1.UI控件概述
iOS的所有UI控件都继承了UIView，而UIView继承了UIResponder基类，UIResponder代表了用户操作的响应着。

### 1.1 控件分类
iOS的UI控件可分为三类：

1. 活动控件 大部分活动控件都继承了UIControl基类，可与用户交互，当用户操作活动控件时，该控件可激活相应的事件
2. 静态控件 静态控件只继承了UIView，不继承UIControl。只用于显示应用状态。
3. 被动控件 被动控件可接受用户操作，仅用于接受用户输入的值，知道用户输入完成，不会触发任何IBAction方法。

###1.2 UIControl基类介绍
>当活动控件上发生指定的事件时，UIControl控件会初始化Action消息，并将该消息发送给事件处理方法。

UIControl提供了如下常用的方法：

* `-(void) addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)events`
* `-(void)removeTarget:(id)target action:(SEL)action forControlEvent:(UIControlEvents)events`
* `-(NSArray*)actionsForTarget:(id)target forControlEvent:(UIControlEvents)controlEvent`
* `-(NSSet*)allTargets`
* `-(UIControlEvents)allControlEvents`

每个UI控件都有4种不同的状态：

* 普通
* 高亮
* 禁用
* 选中

`UIControl`提供属性判断状态：

* `enabled:` 判断是否可用
* `selected:` 判断是否被选中
* `highlighted:` 判断是否高亮

需要定制碰触UIControl控件时的外观，可以通过重写UIControl控件的如下方法实现：

* `- beginTrackingWithTouch:withEvent:`
* `continueTrackingWithTouch:withEvent:`
* `endTrackingWithTouch:withEvent:`


##2.按钮(UIButton)
UIButton继承了UIControl:UIView

1. Type 按钮选择类型
	* Custom  依靠开发者设置
	* System  iOS默认风格
	* Detail Disclosure “i”型图标 用于显示当前列表项的详情
	* Info Light  “i”型图标，用于显示简短的说明信息
	* Info Dark   “i”型图标
	* Add Contact   “+”型图标，用于添加联系人
2. State Config  用于设置按钮的状态
3. Title 
4. Font
5. Text Color
6. Shadow Color
7. Image
8. Background
9. Shadow Offset
10. Line Break
11. Edge 控制按钮的边界
12. Inset 控制按钮的边界间距（相当于按钮四周留白）

##3.文本框(UITextField)

属性：

1. Placeholder
2. Border Style 边框风格
3. Clear Button 清除按钮
4. Min Font Size/Adjust to Fie 文本字体大小随着文本框的减小自动缩小
5. Capitalization  自动转换文本框内输入文本的大小写
6. Correction 自动更正
7. KeyBoard   
8. Return Key
	* auto-enable Return Key:
	* Secure 
	
##### 完成后关闭输入法

在Interface Builder 中为第一个文本框 的`Did End On Exit`(退出编辑)事件绑定事件处理方法。

控制器的实现部分：

```
- (IBAction)finishEdit:(UITextField *)sender {
    //sender放弃作为第一响应者
    [sender resignFirstResponder];
}
```

##### 触碰背景关闭键盘

1. 在Interface Builder中选定应用界面的背景控件，修改控件的实现类为`UIControl`
2. 绑定背景控件的`Touch Down`事件处理方法
3. 实现控制器的事件方法

```
- (IBAction)backTap:(UIControl *)sender {
    
    [self.nameField resignFirstResponder];
    [self.passField resignFirstResponder];
}
```






