//
//  DiagnosedHappinessViewController.swift
//  Psychologist
//
//  Created by adminstrator on 16/2/16.
//  Copyright © 2016年 ddd.cc. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewController: HappinessViewController , UIPopoverPresentationControllerDelegate {
    
    
    override var happiness : Int {
        didSet {
            diagnosticHistory += [happiness]
        }
    }
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    var diagnosticHistory : [Int] {
        
        get {
        return defaults.objectForKey(History.defaultKey) as? [Int] ?? []
        }
        set {
            defaults.setObject(newValue, forKey: History.defaultKey)
        }
    }
    
    private struct History {
        
        static let SegueIdentifier = "Show Diagnostic History"
        static let defaultKey = "DiagnosedHappinessViewController.happiness"
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case History.SegueIdentifier :
                if let tvc = segue.destinationViewController as? TextViewController {
                     tvc.text = "\(diagnosticHistory)"
                    if let ppc = tvc.popoverPresentationController {
                        ppc.delegate = self
                    }
                }
            default : break

            }
            
        }
    }
    
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
         return UIModalPresentationStyle.None
    }
    
}
