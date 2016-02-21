//
//  ViewController.swift
//  Calculator
//
//  Created by adminstrator on 16/2/13.
//  Copyright © 2016年 ddd.cc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    var userInputDigit : Bool = false
    var brain = CalculatorBrain()
    
    var userDefault = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain.program =  userDefault.objectForKey("brainProgram") ?? ""
    }
    
    @IBAction func appendDigit(sender: UIButton) {
        
        let digit =  sender.currentTitle!
        
        if userInputDigit {
            display.text = display.text! + digit
        }else {
            display.text = digit
            userInputDigit = true
        }
        
    }
    
    @IBAction func operate(sender: UIButton) {
        
       
        if userInputDigit {
            enter()
        }
        
        if  let operation = sender.currentTitle {
            if let result = brain.performOperation(operation){
                displayValue = result
            }
        }
    }
   
    @IBAction func enter() {
        userInputDigit = false
        if let result = brain.pushOperand(displayValue){
            displayValue = result
            userDefault.setObject(brain.program, forKey: "brainProgram")
            userDefault.synchronize()
        }
    }
    
    var displayValue : Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
        }
        
    }
    
    

}

