//
//  ViewController.swift
//  LoveFinder
//
//  Created by adminstrator on 16/2/23.
//  Copyright © 2016年 ddd.cc. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate {

    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var birth: UIDatePicker!
    @IBOutlet weak var heightField: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var houseField: UISwitch!
    
    @IBOutlet weak var result: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func heightChanged(sender: UISlider) {
       heightLabel.text = "\(Int( sender.value))厘米"
    }
    
    @IBAction func okTapped(sender: UIButton) {
        let genderText = gender.selectedSegmentIndex == 0 ? "高富帅" :"白富美"
        
        let gregorian = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let now = NSDate()
        
        let components = gregorian?.components(NSCalendarUnit.Year, fromDate: birth.date, toDate: now, options: NSCalendarOptions.init(rawValue: 0))
        let house =  houseField.on ? "有房" :"没房"
        
        result.text = "\(nameField.text!),\(genderText), \(components?.year), \(heightField.value)厘米，\(house)"
        
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

