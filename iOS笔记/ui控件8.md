##1.导航条(UINavigationBar)与导航条控制器(UINaigationController)
当iOS应用需要显示具有层次化的工作流时，采用UiNavigationController比较合适。UINavagationController是一个控制器，用户交互行为主要靠UINavationBar完成。

###1.1 使用导航条
导航条(UINavigationItem)继承了UIView控件，通常作为多个UINavigationItem的容器，以Stack的形式管理多个UINavigationItem控件，导航条上每次只能看到一个UINavigationItem对象。

UINavigationBar管理UINavigationItem的方法和属性:

* `-pushNavigationItem:animated:`
* `-popNavigationItemAnimated:`
* `-setItems:animated:`
* `items`
* `topItem`
* `backItem`

UINavigationItem作为一个容器，由标题、左边的按钮、右边的按钮组成，每一个按钮都是一个UIBarButtonItem控件。提配置UINavigationItem的属性和方法：

* `title` 设置UINavigationItem的标题文本
* `hidesBackButton:` 设置或返回是否显示后退按钮，YES则隐藏
* `titleView` 设置或返回UINavigationItem的标题控件
* `leftBarButtonItems` 设置或返回左边的多个按钮组成的数组
* `leftBarButtonItem` 设置或返回UINavigationItem左边的单个按钮
* `rightBarButtonItems` 右边的多个按钮
* `rightBarButtonItem` 右边的单个按钮
* `-selfHidesBackButton:animated:` 
* `-setLeftBarButtonItems:animated:`
* `-setLeftBarButtonItem:animated:`
* `-setRightBarButtonItems:animated:`
* `-setRightBarButtonItem:animated:`

###1.2 使用UINavigationController
UINavigationController比UINavigationBar强大得多，不仅封装了UINavigationBar，而且自动为每个接受它管理的UIViewController自动添加UINavigationBar。UIViewController底部还可以设置一个工具条。

UINavigationController 管理多个UIViewController的属性和方法:

* `topViewController` 只读，返回栈顶的UIViewController
* `visibleViewController` 只读，返回UINavigationController中可见的界面对应的UIViewController
* `viewController` 设置或返回所有的UIViewController
* `-setViewControllers:animated:` 为UINavigationController设置所有的UIViewController
* `-pushViewController:Animated:` 将制定的UIViewController压入
* `-popViewControllerAnimated:` 弹出
* `-popToRootViewControllerAnimated:` 弹出除root UIViewController之外所有的UIViewController
* `-popToViewController:animated:` 弹出到制定的UIViewController

配置导航条的方法和属性：

* `navigationBar`  只读， 控件管理的导航条
* `navigationBarHidden` 设置或返回是否隐藏导航条
* `-setNavigationBarHidden:animated:` 设置是否隐藏导航条

配置工具条的方法：

* `toolbar`只读，返回控件管理的工具条
* `setToolbarHidden:animated:`
* `toolbarHidden`

###1.3 使用segue控制过渡

Storyboard提供了segue进行导航，优势在于，必须编写代码，直接在storyboard配置。

为两个视图控制器创建segue由三种类型

- `push` 只有使用在UINavigationController视图控制器过渡才支持。
- `modal` 普通视图控制器过渡
- `custom` 自定义segue

UIViewController为segue提供的方法：

- `-(void)performSegueWithIdentifier:(NSString*)identifier sender:(id)sender:` 视图孔子器调用该方法即可根据segue的标示符触发指定的segue
- `-(void)perpareForSegue:(UIStoryboardSegue*)segue sender:(id)sender:` 当segue触发，且将要从一个视图控制器跳转到下一个视图控制器时，将会自动调用该方法。

`UIStoryboardSegue`对象提供的属性：

- `sourceViewController` 
- `destinationViewController` 获取segue将要跳转到的视图控制器
- `identifier` segue的唯一标识


向目标视图传值：

```
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    id dest = segue.destinationViewController;
    //使用KVC方式赋值
    [dest setValue:self.mainContent forKey:@"vContent"];
}
```

####1.3.1 使用segue控制导航
segue 可以控制UINavigationController管理的视图控制器之间的跳转