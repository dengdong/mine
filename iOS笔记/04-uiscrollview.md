# 04-UIScrollView


##UIScrollView的常见属性

```objc
//这个属性用来表示UIScrollView滚动的位置
//就是内容左上角与ScrollView左上角的间距值
@property (nonatomic) CGPoint contentOffset;
```

```objc
//这个属性用来表示UIScrollView内容的尺寸，滚动范围
@property(nonatomic) CGSize contentSize;
```

```objc
//这个属性能够在UIScrollView的四周增加额外的滚动区域
//一般用来避免scrollView的内容被其他控件挡住
@property (nonatomic)UIEdgeInsets contentInset;
```
