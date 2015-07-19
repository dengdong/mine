###1. 网格(UICollectionView)与网格控制器(UICollectionViewController)

UICollectionView是iOS6.0新增的一种UI控件。UICollectionView继承了UIScrollView，具有UIScrollView的功能。UICollectionViewController实例自动设为UIScrollView委托。

UICollectionView支持如下属性：

1. `Layout` 可以设置Flow、Custom两个属性值。分别对应`UICollectionViewFlowLayout`和`UICollectionViewLayout` 布局对象。如果选择FLow，在Xcode的dock面板中可以看到UICollectionView包含一个Collection View Flow Layout对象。UICollectionViewFlowLayout布局采用流的方式管理UICollectionView中的所有单元格。 
  UICollectionViewFLowLayout对象的属性：
  
  * `scrollDirection`  控制控件的滚动方向
  * `minimumLineSpacing` 控制单元格之间的最小行间距
  * `minimumInteritemSpacing`控制单元格之间的最小列间接
  * `itemSize`  控制单元格的宽度和高度
  * `sectionInset` 设置分区上下左右空白区域的大小
  * `headerReferenceSize` 设置个分区的页眉控件的大小
  * `footerReferenceSize` 设置各分区页脚控件的大小
2. Scroll Direction
3. Accessories 设置是否显示页眉页脚

####1.1 使用UICollectionViewDelegateFlowLayout顶置布局
使用UICollectionViewFlowLayout布局对象管理UICollectionView的所有单元格，这些单元格的大小、单元格之间的间距和行距都是相同的。如果程序需要让UICollectionView中个控件各自显示不同 大小，可以借助`UICollectionViewDelegateFlowLayout`协议来实现。

`UICollectionViewDelegateFlowLayout`协议继承了UICollectionViewDelegate协议。UICollectionViewDelegateFlowLayout协议额外定义的常用方法：

- `-collectionView:layout:sizeForItemAtIndexPath:` 返回的CGSize对象将控制指定NSIndexPath对应的单元格的大小
- `-collectionView:layout:insetForSectionAtIndex:`返回的UIEdgeInsets对象将控制指定分区上、下、左、右空白区域的大小
- `-collectionView:layout:minimumLineSpacingForSectionAtIndex:`分会的长度将控制分区内最小的行间距
- `-collectionView:layout:minimumLnteritemSpacingForSectionAtIndex:` 返回的值控制分区内最小的列间距。
- `-collectionView:layout:referenceSizeForHeaderInSecction:` 返回的CGSize控制指定分区的页眉控件的大小
- `-collectionView:layout:referenceSizeForFotterInSection:` 返回的CGSize将控制指定分区页脚控件的大小。


```
-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIImage * img = [UIImage imageNamed:[cImgs objectAtIndex:indexPath.row]];
    return  CGSizeMake(img.size.width/2, img.size.height/2);
}
```

####1.2  扩展UICollectionViewLayout定制布局

如果希望UICollectionView以更复杂、更灵活的方式对单元格进行布局，可以通过继承UICollectionViewLayout,实现自己的布局管理器来实现。

继承UICollectionViewLayout时，通常重写如下方法：

- `-prepareLayout:`  开始布局时调用该方法执行准备工作
- `-layoutAttributesForElementsRect` 返回值控制指定NSRect区域内所有单元格的大小和位置等布局信息
- `-layoutAttributesForitemAtIndexPath:`返回值控制指定NSIndexPath对应的单元格的大小和位置等布局信息。
- `-layoutAttributesForSupplementaryViewOfKind:atIndexPath:` 该方法的返回值控制指定分区的页眉控件、页脚控件和位置等布局信息
- `-layoutAttributesForDecorationViewOfKind:atIndexPath:`返回值控制指定分区的装饰控件的大小和位置等布局信息


#####示例：自定义UICollectionViewLayout

自定义类的接口部分：

```
@interface CircleLayout : UICollectionViewLayout
@property(nonatomic ,assign) CGPoint center;
@property(nonatomic,assign)CGFloat radius;
@property(nonatomic,assign)NSInteger cellCount;
@end
```

实现部分：

```
#define ITEM_SIZE 72
@implementation CircleLayout

//开始执行的方法
-(void)prepareLayout
{
    [super prepareLayout];
    CGSize size = self.collectionView.frame.size;
    //计算需要包含多少个单元格
    _cellCount = [[self collectionView] numberOfItemsInSection:0];
    //计算环的圆心
    _center = CGPointMake(size.width/2.0, size.height/2.0);
    //计算环的半径
    _radius = MIN(size.width, size.height)/2.5;
}
//该方法的返回值决定UICollectionView所包含的控件的大小
-(CGSize)collectionViewContentSize
{
    return [self collectionView].frame.size;
}

//该方法返回的UICollectionViewLayoutAttributes控件指定单元格的大小和位置
-(UICollectionViewLayoutAttributes*) layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes* attributes = [UICollectionViewLayoutAttributes
                                                    layoutAttributesForCellWithIndexPath:indexPath];
    //设置单元格的大小
    attributes.size = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
    //设置该单元格的中心坐标点
    attributes.center = CGPointMake(_center.x + _radius*cosf(2*M_PI * indexPath.item /_cellCount), _center.y + _radius*sinf(2*M_PI*indexPath.item/_cellCount));
    return attributes;
}
//该方法的返回值控制UICollectionViewLayoutAttributes集合一次控制
//指定CGRectangular范围内单元格的大小和位置
-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray* attributes = [NSMutableArray array];
    for (NSInteger i =0; i<_cellCount; i++) {
        NSIndexPath* indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    return attributes;
}
//每当单元格动态显示时自动调用该方法
-(UICollectionViewLayoutAttributes*)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    UICollectionViewLayoutAttributes* attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    attributes.alpha = 0.0;
    attributes.center = CGPointMake(_center.x, _center.y);
    return  attributes;
}
//当动态单元格消失时调用该方法
-(UICollectionViewLayoutAttributes*)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    UICollectionViewLayoutAttributes* attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    attributes.alpha = 0.0;
    attributes.center = CGPointMake(_center.x, _center.y);
    attributes.transform3D = CATransform3DMakeScale(0.1, 0.1, 1.0);
    return attributes;
}

@end
```

具体调用：

```
-(void)viewDidLoad
{
    cellCount = 16;
    CircleLayout* circle = [[CircleLayout alloc]init];
    self.circleGrid.collectionViewLayout = circle;
    self.circleGrid.backgroundColor = [UIColor grayColor];
    self.circleGrid.dataSource = self;
    self.circleGrid.delegate = self;
    //创建一个处理点击的手势处理器
    UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.circleGrid addGestureRecognizer:tapRecognizer];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return cellCount;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellId = @"cellId";
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    return cell;
}
//定义处理手势的方法
-(void)handleTap:(UITapGestureRecognizer*)sender
{
    if (sender.state == UIGestureRecognizerStateEnded) {
        //获取点击点的位置
        CGPoint initialPinckPoint = [sender locationInView:self.circleGrid];
        //获取点击点所在的NSIndexPath
        NSIndexPath* tappedCellPath = [self.circleGrid indexPathForItemAtPoint:initialPinckPoint];
        if (tappedCellPath) {
            cellCount--;//减少一个单元格
            [self.circleGrid deleteItemsAtIndexPaths:[NSArray arrayWithObject:tappedCellPath]];
        }
        {
            cellCount ++;
            [self.circleGrid insertItemsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForItem:0 inSection:0]]];
        }
    }
}
```

####1.3 多分区网格
UICollectionView实现多分区，需要重写`UICollectionViewDataSource`协议的`numberOfSectionsInCollectionView:`方法，返回包含的分区数。如果需要添加分区的页眉页脚控件，要重写`UICollectionViewDataSource`协议中的`-collectionView:viewForSupplementaryElementOfKindAtIndexPath`方法，返回的控件作为分区的页眉、页脚控件。
