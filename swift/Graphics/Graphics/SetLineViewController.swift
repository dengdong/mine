//
//  SetLineViewController.swift
//  Graphics
//
//  Created by adminstrator on 16/3/8.
//  Copyright © 2016年 ddd. All rights reserved.
//

import UIKit

class SetLineViewController: UIViewController , UIPickerViewDelegate,
            UIPickerViewDataSource{
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var slider: UISlider!
    
    
    let patterns = [
        Pattern(pattern: [10.0,10.0], count: 2),
        Pattern(pattern: [10.0,20.0,10.0], count: 3),
        Pattern(pattern: [10.0,20.0,30.0], count: 3),
        Pattern(pattern: [10.0,20.0,10.0,30.0], count: 4),
        Pattern(pattern: [10.0,10.0,20.0,20.0], count: 4),
        Pattern(pattern: [10.0,10.0,20.0,30.0,50.0], count: 5)
    ]
    
    var patternCount : Int = 0
    
    var dashView : DashLineView  = DashLineView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        patternCount = patterns.count
        dashView = DashLineView()
        dashView.frame = self.scrollView.bounds
        scrollView.addSubview(dashView)
        
        dashView.pattern = patterns[0]
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        picker.selectRow(0, inComponent: 0, animated: false)
        
        self.slider.addTarget(self, action: Selector("dashPahse"), forControlEvents: .ValueChanged)
    }
    
    
    func dashPahse(){
        dashView.dashPhase = CGFloat( self.slider.value )
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return patternCount
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let p = patterns[row]

        let title =  p.pattern.map{ "\($0)"}.joinWithSeparator("-")
        return title
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dashView.pattern = patterns[row]
    }
    
    
    
    @IBAction func reset(sender: UIButton) {
        dashView.dashPhase = 0.0
    }

}

struct Pattern {
    var pattern = [CGFloat]()
    var count : Int
}
