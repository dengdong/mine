//
//  UiSegmentControlTest.swift
//  iOSUIControls
//
//  Created by adminstrator on 16/3/3.
//  Copyright © 2016年 ddd. All rights reserved.
//

import UIKit

/*
1. 通过分段控制背景颜色
2. 动态增加、删除分段
*/
class UiSegmentControlTest: UIViewController {
    
    @IBOutlet weak var segNameField: UITextField!
    @IBOutlet weak var segment: UISegmentedControl!
    

    @IBAction func segmentChanged(sender: UISegmentedControl) {
        
        switch (sender.selectedSegmentIndex){
        case 0:
            self.view.backgroundColor = UIColor.redColor()
        case 1:
            self.view.backgroundColor = UIColor.greenColor()
        case 2:
            self.view.backgroundColor = UIColor.blueColor()
        case 3:
            self.view.backgroundColor = UIColor.purpleColor()
        default:
            self.view.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(100)), green: CGFloat(arc4random_uniform(100)), blue: CGFloat(arc4random_uniform(100)), alpha: 0)
        }
    }
    
    @IBAction func addSegment(sender: UIButton) {
        
        let txt = segNameField.text
        if txt != "" {
            segment.insertSegmentWithTitle(txt, atIndex: segment.numberOfSegments, animated: true)
        }
        
    }
    
    @IBAction func removeSegment(sender: UIButton) {
        segment.removeSegmentAtIndex(segment.numberOfSegments-1, animated: true)
    }
    
}
