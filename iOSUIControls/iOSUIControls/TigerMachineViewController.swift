//
//  TigerMachineViewController.swift
//  iOSUIControls
//
//  Created by adminstrator on 16/3/4.
//  Copyright © 2016年 ddd. All rights reserved.
//

import UIKit

import AudioToolbox

class TigerMachineViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var iv: UIImageView!
    
    @IBOutlet weak var bn: UIButton!
    
    
    var loseImage : UIImage?
    var winImage : UIImage?
    
    var images = [UIImage?]()
    
    let kImageTag = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loseImage = UIImage(named: "phone")
        winImage = UIImage(named: "shopping-cart")
        
        let img1 = UIImage(named: "selected-child")
                let img2 = UIImage(named: "selected-coffie")
                let img3 = UIImage(named: "selected-phone")
                let img4 = UIImage(named: "selected-shopping-cart")
                let img5 = UIImage(named: "child")
                let img6 = UIImage(named: "coffie")
        
        images = [img1, img2, img3 , img4, img5, img6]
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 5
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, var reusingView view: UIView?) -> UIView {
        
        if view?.tag != kImageTag {
            view = UIImageView(image: images[row])
            view?.tag = kImageTag
            view?.userInteractionEnabled = false
        }
        return view!
        
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func showLose(){
        self.iv.image = loseImage
        self.bn.enabled = true
    }
    
    func showWin(){
        if let soundURL = NSBundle.mainBundle().URLForResource("1", withExtension: "mp3") {
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL, &mySound)
            // Play
            AudioServicesPlaySystemSound(mySound);
        }
        
        self.iv.image = winImage
        self.bn.enabled = true
    }

    
    @IBAction func clicked(sender: UIButton) {
        self.bn.enabled = false
        self.iv.image = nil
        var result = [ Int : Int  ]()
        
        
        
        if let soundURL = NSBundle.mainBundle().URLForResource("2", withExtension: "wav") {
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL, &mySound)
            // Play
            AudioServicesPlaySystemSound(mySound);
        }
        
        for i in 0..<5 {
            let selectedVal = Int( arc4random_uniform(100)) %  images.count
            self.picker.selectRow(selectedVal, inComponent: i, animated: true)
            
            if let  c = result[selectedVal]  {
                result[selectedVal] = c + 1
            }else {
                result[selectedVal] = 1
            }
            
            
        }
        
        var maxOccurs = 1
        
        for num in result.keys {
            if result[num] > maxOccurs {
                maxOccurs = result[num]!
            }
        }
        
        if maxOccurs >= 3 {
            self.performSelector(Selector("showWin"), withObject: nil , afterDelay: 0.5)
        } else {
            //showLose()
            self.performSelector(Selector("showLose"), withObject: nil, afterDelay: 0.5)
        }

        
        
        
    }
    
}
