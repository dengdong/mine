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

