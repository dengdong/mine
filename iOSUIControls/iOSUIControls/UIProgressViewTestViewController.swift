//
//  UIProgressViewTestViewController.swift
//  iOSUIControls
//
//  Created by adminstrator on 16/3/4.
//  Copyright © 2016年 ddd. All rights reserved.
//

import UIKit

class UIProgressViewTestViewController: UIViewController {

    
    @IBOutlet var indicators: [UIActivityIndicatorView]!
    
    
    
    @IBOutlet weak var prog1: UIProgressView!
    
    @IBOutlet weak var prog2: UIProgressView!
    
    @IBOutlet weak var prog3: UIProgressView!
    
    var timer : NSTimer?
    var progVal  = Float( 0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let trackImage = UIImage(named: "star1")
        trackImage?.resizableImageWithCapInsets(UIEdgeInsetsZero, resizingMode: .Tile)
        
        let progressImage = UIImage(named: "star2")
        progressImage?.resizableImageWithCapInsets(UIEdgeInsetsZero, resizingMode: .Tile)
       
        self.prog3.trackImage = trackImage
        self.prog3.progressImage = progressImage
        
        
    }
    
    @IBAction func clicked(sender: UIButton) {
        progVal = 0
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.2,
            target: self,
            selector: Selector("changeProgress"),
            userInfo: nil, repeats: true)
    }
    
    func changeProgress(){
        progVal += 0.01
        if progVal >= 1.0 {
            timer?.invalidate()
        }else{
            self.prog1.setProgress(progVal, animated: true)
            self.prog2.setProgress(progVal, animated: true)
            self.prog3.setProgress(progVal, animated: true)
        }
    }
    
    @IBAction func start(sender: AnyObject) {
        indicators.forEach{$0.startAnimating()}
    }
    
    @IBAction func end(sender: AnyObject) {
        indicators.forEach{$0.stopAnimating()}
    }
    
}
