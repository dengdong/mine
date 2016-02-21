//
//  HappinessViewController.swift
//  Happiness
//
//  Created by adminstrator on 16/2/15.
//  Copyright © 2016年 ddd.cc. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController , FaceViewDataSource {

    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSrouce = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    private struct Constants {
        static let HappinessGestureScale : CGFloat  = 4
    }
    
    @IBAction func changeHappiness(sender: UIPanGestureRecognizer) {
        
        switch sender.state {
        case .Ended : fallthrough
        case .Changed:
            let translation = sender.translationInView(faceView)
            print ("translation = \(translation.y)")
            let happinessChange = Int(translation.y / Constants.HappinessGestureScale)
            if happinessChange != 0 {
                happiness += happinessChange
                sender.setTranslation(CGPointZero, inView: faceView)
            }
        default: break
        }
        
    }
    var happiness : Int = 50 { // 0 = very sad , 100 = ecstatic
        didSet {
            happiness = min( max(happiness, 0),100)
            print("happiness \(happiness)")
            updateUI()
        }
    }
    private func updateUI() {
        faceView?.setNeedsDisplay()
        title = "\(happiness)"
    }
    
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness - 50) / 50
    }
    
}
