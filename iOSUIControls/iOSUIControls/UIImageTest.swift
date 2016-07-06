//
//  UIImageTest.swift
//  iOSUIControls
//
//  Created by adminstrator on 16/3/3.
//  Copyright © 2016年 ddd. All rights reserved.
//

import UIKit

class UIImageTest: UIViewController {
    
    @IBOutlet weak var iv: UIImageView!
    
    @IBOutlet weak var iv2: UIImageView!
    
    var images = [String]()
    var curImage = 0
    var alpha = CGFloat(1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        images = ["fanbingbing", "japanese","korean","libingbing"]
     
        self.iv.userInteractionEnabled = true
        self.iv.image = UIImage(named: images[++curImage % images.count ])

        let singleTap =  UITapGestureRecognizer(target: self, action: Selector("tapped:"))
        self.iv.addGestureRecognizer(singleTap)
    }
    
    func tapped(gestureRecognizer: UITapGestureRecognizer){
        
        let srcImage = self.iv.image
        
        let pt = gestureRecognizer.locationInView(self.iv)
        let sourceImageRef = srcImage?.CGImage
        var scale = (srcImage?.size.width)! / 320
        var x = pt.x * scale
        var y = pt.y * scale
        
        if (x + 120 ) > srcImage?.size.width {
            x =  srcImage!.size.width - 140
        }
        if (y + 120) > srcImage?.size.height {
            y = srcImage!.size.height - 140
        }
        
        let newImageRef = CGImageCreateWithImageInRect(sourceImageRef, CGRect(x: x, y: y, width: 140, height: 140))
        self.iv2.image = UIImage(CGImage: newImageRef!)
    }
    
    @IBAction func plus(sender: UIButton) {
        alpha += 0.1
        if alpha >= 1.0 {
            alpha = 1.0
        }
        self.iv.alpha = alpha
    }
    
    @IBAction func minus(sender: UIButton) {
        alpha -= 0.1
        if alpha <= 0.0 {
            alpha = 0.0
        }
        self.iv.alpha = alpha
    }
    
    @IBAction func next(sender: UIButton) {
        self.iv.image = UIImage(named: images[++curImage % images.count ])
    }
    
    
}
