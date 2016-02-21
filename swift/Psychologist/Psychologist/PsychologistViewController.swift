//
//  ViewController.swift
//  Psychologist
//
//  Created by adminstrator on 16/2/16.
//  Copyright © 2016年 ddd.cc. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nothing(sender: UIButton) {
        performSegueWithIdentifier("nothing", sender: nil)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var destination = segue.destinationViewController as UIViewController
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController!
        }
        
        if let hvc  = destination as? HappinessViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "sad" : hvc.happiness =  0
                case "happy" : hvc.happiness = 100
                case "nothing" : hvc.happiness = 25
                default : hvc.happiness = 50
                }
            }
        }
    }

}

