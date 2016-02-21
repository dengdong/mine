//
//  ViewController.swift
//  Cassini
//
//  Created by adminstrator on 16/2/20.
//  Copyright © 2016年 ddd.cc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let lvc = segue.destinationViewController as? ImageViewController {
            if let identity = segue.identifier {
                switch(identity) {
                    case "img1":
                      lvc.imageUrl = DemoUrl.Nasa.aa
                    lvc.title = "img1"
                    case "img2":
                    lvc.imageUrl = DemoUrl.Nasa.Cassini
                    lvc.title = "img2"
                    case "img3":
                    lvc.imageUrl = DemoUrl.Nasa.horse
                    lvc.title = "img3"
                default : break
                }
            }
        }
    }

}

