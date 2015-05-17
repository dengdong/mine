
##1.选择器(UIPickerView)

UIPickerView是一个选择器，可以生成单列的选择器，也可生成多列的选择器，可以自定义选择器的外观。UIPickerView直接继承了UIView，没有继承UIControl，UIPickerView的事件由委托对象完成。

UIPickerVIew常用的属性和方法如下：

1. `numberOfComponents` 只读，获取指定列包含的列表项的数量。
2. `showSelectionIndicator` 控制是否显示UIPickerView中的选中标记(高亮背景)
3. `-numberOfRowsInComponent:` 获取包含的列数量
4. `-rorSizeForComponent:` 获取包含的指定列中列表项的大小。CGSize
5. `-selectRow:inComponent:animated:` 设置选中指定列的特定列表项。
6. `-selectRowInComponent:`  返回控件指定列中被选中的列表项
7. `viewForRow:forComponent:` 返回指定列的列表项所使用的UiView控件

UIPickerView包含的列及列包含的列表项由`UIPickerViewDataSource`对象设置，需要实现该对象的两个方法：

* `-numberOfComponentsInPickerView:` 该UIPickerView将通过该方法来判断包含多少列
* `-pickerView:numberOfRowsInComponent:` 通过该方法判断指定列包含多少列表项

控制UIPickerView中的列的宽度、列表项的大小和外观，以及控件的事件响应，需要设置UIPickerViewDeletegate委托对象，根据需要，实现委托对象的如下方法：

* `-pickerView:rowHeightForComponent:`该方法返回的CGFloat将作为该UIPickerView控件中指定列表项的高度
* `-pickerView:widthForComponent:` 返回的CGFloat作为指定列表项的宽度
* `- pickerView:titleForRow:forComponent` NSString 作为指定列表项的文本标题
* `-pickerView:viewForRow:forComponent:reusingView:`返回的UIView控件直接作为UIPickerView指定列的指定列表项
* `-pickerView:didSelectRow:inComponent:` 选中指定列的指定列表项是触发

#####案例：单列选择器/多列选择器/级联选择器
<img src="http://images.cnblogs.com/cnblogs_com/dong-deng/685410/o_QQ20150505-2@2x.png" height="400px" />

定义三个UIPickerView分别用作单列、多列、级联选择器，并关联IBOutlet，控制器分别实现`UIPickerViewDataSource`,`UIPickerViewDelegate`

```
@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@property (weak, nonatomic) IBOutlet UIPickerView *multiPicker;

@property (weak, nonatomic) IBOutlet UIPickerView *relPicker;
```

在控制器实现类中实现协议的方法：

```
NSArray* province;

NSArray* drink;

NSArray* size;

NSDictionary* city;
NSArray* prov;
NSString* selectedProv ;
-(void) viewDidLoad
{
    [super viewDidLoad];
    //初始化NSArray对象
    province = [NSArray arrayWithObjects:@"广东",@"湖北",@"北京",@"四川",@"浙江",nil];
    
    size = [NSArray arrayWithObjects:@"大杯",@"中杯",@"小杯", nil];
    drink = [NSArray arrayWithObjects:@"红茶",@"绿茶",@"咖啡",@"拿铁",@"芒果冰沙", nil];
    
    city = [NSDictionary dictionaryWithObjectsAndKeys:
            [NSArray arrayWithObjects:@"朝阳区",@"海淀区",@"大兴区",@"房山区", nil],@"北京",
            [NSArray arrayWithObjects:@"广州",@"深圳",@"珠海", nil],@"广东",
            [NSArray arrayWithObjects:@"武汉",@"荆州",@"宜昌",@"荆门",@"黄冈", nil],@"湖北",nil];
    
    prov = [[city allKeys] sortedArrayUsingSelector:@selector(compare:)];
    //为UIPickerView设置dataSrouce和delegate
    self.picker.dataSource = self;
    self.picker.delegate = self;
    
    self.multiPicker.dataSource = self;
    self.multiPicker.delegate = self;
    
    selectedProv = [prov objectAtIndex:0];
    self.relPicker.dataSource = self;
    self.relPicker.delegate = self;
}
//UIPickerViewDataSource中定义的方法，该方法返回值决定控件包含多少列
-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if(pickerView == self.multiPicker)
    {
        return 2;
    }
    else if(pickerView == self.relPicker)
    {
        return 2;
    }
    return 1;//返回1 表明只包含1列
}

//UIPickerViewDataSrouce定义，该方法返回值决定控件指定列包含多少列表项
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(pickerView == self.multiPicker)
    {
        if(component == 0)//如果是第一列
        {
            return size.count;
        }
        return drink.count; //其它列
    }
    else if(pickerView == self.relPicker)
    {
        if(component == 0)
        {
            return prov.count;
        }
        NSInteger c = [[city objectForKey:selectedProv] count];
        return c;
    }
    return province.count;
}

//UiPickerViewDelegate定义方法返回值作为指定列的标题文本
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(pickerView == self.multiPicker)
    {
        if(component == 0)
        {
            return  [size objectAtIndex:row];
        }
        return [drink objectAtIndex:row];
    }
    else if(pickerView == self.relPicker)
    {
        if(component ==0)
        {
            return [prov objectAtIndex:row];
        }
        return [[city objectForKey:selectedProv] objectAtIndex:row];
    }
    return [province objectAtIndex:row];
}

//选中指定列和列表项时触发
-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString* msg ;
    if(pickerView == self.picker)
    {
        msg =[NSString stringWithFormat:@"选中的省份是%@",[province objectAtIndex:row]];
    }
    else if(pickerView == self.multiPicker)
    {
        NSArray* tmp = component == 0? size : drink;
        msg =[NSString stringWithFormat:@"选中的是%@",[tmp objectAtIndex:row]];
    }
    else if(pickerView == self.relPicker)
    {
        if(component ==0)
        {
        selectedProv = [prov objectAtIndex:row];
        //控制重写加载第二个列表
        [self.relPicker reloadComponent:1];
        }
        NSArray* tmp = component ==0?prov:[city objectForKey:selectedProv];
        msg = [NSString stringWithFormat:@"选中的是%@",[tmp objectAtIndex:row]];
    }
    UIAlertView* alert = [[UIAlertView alloc]
                          initWithTitle:@"提示"
                          message:msg
                          delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if(pickerView == self.multiPicker || pickerView == self.relPicker)
    {
        if(component==0)
        {
            return 90;
        }
        return 210;
    }
    return 390;
}
```








