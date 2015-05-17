##1. 搜索条(UISearchBar)
搜索条(UISearchBar)由一个文本框和几个按钮组成，当用户在文本框输入部分内容，程序即可按指定的规则进行搜索。

UISearchBar特有的属性:

1. Options
	`Shows Search Results Button `
	`Shows Bookmarks Button`
	`Shows Cancel Button`
2. Shows scope 与Scope Titles


UISearchBar控件的不同部分会触发不同的事件，UISearchBar的委托对象需要实现UISearchBarDelegate协议：

* `-searchBar:textDidChange:`
* `-searchBarBookmarkButtonClicked:`
* `-searchBarCancelButtonClicked:`
* `-searchBarSearchButtonClicked:`
* `-searchBarResultsListButtonClicked:`
* `-searchBar:selectedScopeButtonIndexDidChange:`

#####示例：使用搜索条过滤、检索TableView

```
@implementation SearchBarViewController

NSArray* sTableData;
NSArray* searchData;
bool isSearch;
-(void) viewDidLoad
{
    [super viewDidLoad];
    isSearch = NO;
    sTableData = [NSArray arrayWithObjects:@"无间道",@"赌神",@"纵横四海",@"重庆森林",@"雷神",@"钢铁侠",@"美国队长",@"复仇者联盟", nil];
    self.searchTable.delegate = self;
    self.searchTable.dataSource = self;
    self.searchBar.delegate = self;
    self.searchTable.tableHeaderView = self.searchBar;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (isSearch) {
        return searchData.count;
    }
    else{
        return sTableData.count;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellId = @"cellId";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    NSInteger rowNo = indexPath.row;
    if (isSearch) {
        cell.textLabel.text = [searchData objectAtIndex:rowNo];
    }
    else{
        cell.textLabel.text = [sTableData objectAtIndex:rowNo];
    }
    return cell;
}
//点击取消按钮
-(void) searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    isSearch = NO;
    [self.searchTable reloadData];
}
//当搜索框的文本改变时触发
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self filterBySubstring:searchText];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self filterBySubstring:searchBar.text];
    [searchBar resignFirstResponder];
}
-(void) filterBySubstring:(NSString*)substr
{
    isSearch = YES;
    NSPredicate* pred = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@",substr];
    searchData = [sTableData filteredArrayUsingPredicate:pred];
    [self.searchTable reloadData];
}
@end
```

###1.2 使用UISearchDisplayController
使用UISearchDisplayController，可以直接在搜索条下方显示搜索列表。

将`Search Bar and Search Display Controller`拖入界面，除了应用界面上显示的UISearchBar控件，在Dock面板上还有`Search Display Controller`控件，默认看不到。选在`Search Display Controller`控件，在连接检查器面板可以看到控件的关联信息。

<img src="http://images.cnblogs.com/cnblogs_com/dong-deng/685410/o_QQ20150511-2@2x.png" height="200" />
<img src="http://images.cnblogs.com/cnblogs_com/dong-deng/685410/o_QQ20150511-3@2x.png" height="200" />

UISearchDisplayController的Outlet属性：

* delegate: 属性值实现UISearchDisplayDelegate协议的对象
* searchBar: 绑定到界面的UiSearBar控件
* searchContentsController:绑定该控件的控制器控件
* searchResultDataSource:该属性代表查询结果的UITableView的dataSource属性
* searchResultDelegate:该属性代表显示查询结果的UITableView的delegate属性

这些属性默认都绑定到当前控制器，因此控制器类接口定义部分实现如下：

```
@interface SearchDisplayViewController : UIViewController<UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate, UISearchDisplayDelegate>

@end
```


控制器的实现代码和SearBar的实现类似，效果如下：
<img src="http://images.cnblogs.com/cnblogs_com/dong-deng/685410/o_QQ20150511-1@2x.png" height="300" />





































