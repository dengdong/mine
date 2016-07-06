//
//  MultiCellViewController.swift
//  iOSUIControls
//
//  Created by adminstrator on 16/3/4.
//  Copyright © 2016年 ddd. All rights reserved.
//

import UIKit

class MultiCellViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet weak var picker: UIPickerView!
    
    
    var books = [String]()
    var authors = [String]()
    
    var dic = [String : [String]]()
    var selectAuthor = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //authors = ["泰戈尔","冯梦龙","李刚"]
        //books = ["飞鸟集","吉檀迦利","醒世恒言","喻世明言","警世通言","疯狂Android讲义", "疯狂iOS讲义"]
        
        dic = ["泰戈尔":["飞鸟集","吉檀迦利"],
            "冯梦龙" : ["醒世恒言","喻世明言","警世通言"],
        "李刚":["疯狂Android讲义", "疯狂iOS讲义"]]
        
        
        self.picker.dataSource = self
        self.picker.delegate = self
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            //return authors.count
            return dic.keys.count
        } else {
            //return books.count
            return (dic[selectAuthor]?.count) ?? 0
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            //return authors[row]
            return dic.keys.sort()[row]
        } else {
            //return books[row]
            return dic[selectAuthor]![row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            selectAuthor = dic.keys.sort()[row]
            picker.reloadComponent(1)
        }
        
        //var tmp = component == 0 ? authors : books
        var tmp = component == 0 ? dic.keys.sort() : dic[selectAuthor]
        var tip = component == 0 ? "作者" : "图书"
        
        let controller = UIAlertController(title: "提示", message: "选中的\(tip)是:\(tmp![row])", preferredStyle: .Alert)
        
        controller.addAction(UIAlertAction(title: "确定", style: .Cancel, handler: nil))
        
        presentViewController(controller, animated: true, completion: nil)
        
    }

    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if component == 0 {
            return 90
        }
        return 210
    }
}
