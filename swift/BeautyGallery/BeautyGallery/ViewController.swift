//
//  ViewController.swift
//  BeautyGallery
//
//  Created by adminstrator on 16/2/24.
//  Copyright © 2016年 ddd.cc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var beautyPicker: UIPickerView!
    
    var beauties = ["范冰冰", "杨幂","李冰冰","王菲","周迅"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        beautyPicker.delegate = self
        beautyPicker.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        if let lvc = segue.destinationViewController as? GalleryViewController {
            if let identity  = segue.identifier {
                if identity == "Gallery" {
                    let index = beautyPicker.selectedRowInComponent(0)
                    var imageName : String?
                    switch index {
                    case 0:
                        imageName = "fangbingbing"
                    case 1:
                        imageName = "yangmi"
                    case 2:
                        imageName = "libingbing"
                    case 3:
                        imageName = "wangfei"
                    case 4:
                        imageName = "zhouxu"
                    default:
                        imageName = nil
                    }
                    lvc.imageName = imageName
                    lvc.title = beauties[index]
                }
            }
        }
    }
    
    @IBAction func close(segure: UIStoryboardSegue){
        print("afd")
    }

}

