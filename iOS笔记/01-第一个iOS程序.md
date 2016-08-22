## storyboard的认识
- 用来描述软件界面
- 默认情况下，程序一启动会加载 Main.storyborad
- 加载storyboard时，会首先加载和显示箭头所指的控制器面板


## IBAction 和 IBOutlet
- IBAction
  -本质是void
  -能让方法具备连线的功能
- IBOutlet
  -能让属性具备连线的功能

## storyborad 连线容易出现的问题
- 连接的方法代码被删掉，但连线没有删掉
  - 可能会出现找不到方法
- 被连接的属性被删掉，但是连线没有删掉

## UIViewController(控制器的认识)
- 一个控制器负责管理一个大界面
- 控制器负责界面的创建、事件处理等

## 类扩展
- 格式

```objc
@interface 类名()
/** 属性、方法的声明 */
@end
```

- 作用
	- 为某个类增加额外的属性和方法声明
	- 可以写在 .h 和 .m 文件中