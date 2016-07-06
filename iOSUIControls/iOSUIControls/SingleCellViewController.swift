//
//  SingleCellViewController.swift
//  iOSUIControls
//
//  Created by adminstrator on 16/3/4.
//  Copyright © 2016年 ddd. All rights reserved.
//

import UIKit

class SingleCellViewController: UIViewController , UIPickerViewDataSource , UIPickerViewDelegate {
    
    @IBOutlet weak var picker: UIPickerView!

    var books :[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        books = ["Java编程思想","深入C#","Cla via C#","琅琊榜","结网","疯狂iOS讲义"]
        
        self.picker.dataSource = self
        self.picker.delegate = self
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return books.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return books[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        var controller = UIAlertController(title: "提示", message: "选中的图书室\(books[row])", preferredStyle: .Alert)
        
        controller.addAction(UIAlertAction(title: "确定", style: .Cancel, handler: nil))
        
        presentViewController(controller, animated: true, completion: nil)
    }
    
}
