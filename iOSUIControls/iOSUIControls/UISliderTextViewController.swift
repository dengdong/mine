//
//  UISliderTextViewController.swift
//  iOSUIControls
//
//  Created by adminstrator on 16/3/4.
//  Copyright © 2016年 ddd. All rights reserved.
//

import UIKit

class UISliderTextViewController: UIViewController {

    @IBOutlet weak var iv: UIImageView!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func changed(sender: AnyObject) {
        iv.alpha = CGFloat( slider.value)
    }
    
}
