//
//  KoreaViewController.swift
//  BeautyGallery
//
//  Created by adminstrator on 16/2/26.
//  Copyright © 2016年 ddd.cc. All rights reserved.
//

import UIKit
import Social

class KoreaViewController: UIViewController {

    
    @IBOutlet weak var beatyImage: UIImageView!
 
    
    @IBAction func facebookTapped(sender: UIButton) {
        Share(SLServiceTypeFacebook)
    }
    
    
    @IBAction func twitterTapped(sender: AnyObject) {
        Share(SLServiceTypeTwitter)
    }
    
    
    @IBAction func weiboTapped(sender: UIButton) {
        Share(SLServiceTypeSinaWeibo)
    }
    
    func Share(serviceType: String!) {
        let vc = SLComposeViewController(forServiceType: serviceType)
        vc.addImage( beatyImage.image)
        vc.setInitialText("lasdjflaskdjflasdj")
        
        self.presentViewController(vc, animated: true, completion: nil)

    }
    
}
