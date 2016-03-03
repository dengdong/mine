//
//  ViewControllerExtension.swift
//  BeautyGallery
//
//  Created by adminstrator on 16/2/24.
//  Copyright © 2016年 ddd.cc. All rights reserved.
//

import UIKit


extension ViewController : UIPickerViewDataSource , UIPickerViewDelegate {
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return beauties.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return beauties[row]
    }
    
}