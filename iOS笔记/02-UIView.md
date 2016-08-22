##UIView的常见属性
- NSArray *subviews
  - 所有的子空间
  - 数组的属性决定子控件的显示层级顺序(下标越大，越显示在上面)

##UIView的常见方法

- addSubView
  - 添加一个子控件
  - 使用这个方法添加的子控件会被塞到subviews数组的最后面

- 可以使用下面的方法调整子控件在subview数组中的顺序
 
 ```objc
 - (void)insertSubview:(UiView *)view atIndex:(NSInteger)index;
 - (void)insertSubview:(UiView *)view belowSubView:(UIView *)siblingSubview;
 - (void)insertSubview:(UIView *)view aboveSubview:(UIView *)siblingSubview

 - (void)bringSubviewToFront:(UIView *) view;
 - (void)sendSubviewToBack:(UIView *) view
```


##UIView的常见属性
```objc
//控件矩形框在父控件中的位置和尺寸(以父控件的左上角为坐标原点)
@property (nonatomic) CGRect frame
```
```objc
//控件矩形框的位置和尺寸（以自己左上角为坐标原点）
@property (nonatomic) CGRect bounds;
```

```objc
///控件中点的位置
@property (nonatomic) CGRect center
 ```














