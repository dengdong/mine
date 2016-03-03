//
//  GalleryViewController.swift
//  BeautyGallery
//
//  Created by adminstrator on 16/2/24.
//  Copyright © 2016年 ddd.cc. All rights reserved.
//

import UIKit
import Social


class GalleryViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    var imageName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let im = imageName{
            image.image = UIImage(named: im)
        }
    }
    
    @IBAction func shareTapped(sender: UIBarButtonItem) {
        
        let social = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
       
            social.addImage(image.image)
        
        social.setInitialText("lasjdflasjdflaksjdflasjdflkajsldfkjalskdfjlajslfd")
        self.presentViewController(social, animated: true, completion: nil)
        
    }
    
}
