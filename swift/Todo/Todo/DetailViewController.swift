//
//  DetailViewController.swift
//  Todo
//
//  Created by adminstrator on 16/2/27.
//  Copyright © 2016年 ddd.cc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController , UITextFieldDelegate {

    @IBOutlet weak var childButton: UIButton!
    @IBOutlet weak var shppintcartButton: UIButton!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var coffieButton: UIButton!
    
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    var todo : TodoModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if todo == nil {
            navigationController?.title = "增加todo"
            childButton.selected = true
        } else {
            navigationController?.title = "修改todo"
            switch (todo?.image ?? "") {
                case "selected-child":
                    childButton.selected = true
                case "selected-coffie":
                    coffieButton.selected = true
                case "selected-phone":
                    phoneButton.selected = true
                case "selected-shopping-cart":
                    shppintcartButton.selected = true

                default:
                    break;
            }
            titleField.text = todo?.title
            datePicker.setDate((todo?.date)!, animated: true)
        }
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        titleField.resignFirstResponder()
    }
    
    
    func resetUI(){
    childButton.selected = false
    shppintcartButton.selected = false
            phoneButton.selected = false
            coffieButton.selected = false
    }
    
    @IBAction func childTapped(sender: UIButton) {
        resetUI()
    childButton.selected = true
        
    }
    
    
    @IBAction func shoppingcartTapped(sender: UIButton) {
        resetUI()
        shppintcartButton.selected = true
    }
    
    @IBAction func phoneTapped(sender: UIButton) {
        resetUI()
        phoneButton.selected = true
    }
    
    @IBAction func coffieTapped(sender: UIButton) {
        resetUI()
        coffieButton.selected = true
    }
    
    @IBAction func okTapped(sender: UIButton) {
        
        var image = ""
        
        if childButton.selected {
            image = "selected-child"
        } else if shppintcartButton.selected {
            image = "selected-shopping-cart"
        } else if phoneButton.selected {
            image = "selected-phone"
        } else if coffieButton.selected {
            image = "selected-coffie"
        }
        
        if todo == nil {
        let uuid = NSUUID().UUIDString
        
        todoItems.append(TodoModel(id: uuid, image: image, title: titleField.text!, date: datePicker.date))
        } else {
            todo?.title =  titleField.text!
            
            todo?.image = image
            todo?.date = datePicker.date
        }
        
    }
    
    
}
