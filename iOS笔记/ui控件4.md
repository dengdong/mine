
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

#####案例：单列选择器







