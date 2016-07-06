//
//  EditTableViewController.swift
//  iOSUIControls
//
//  Created by adminstrator on 16/3/5.
//  Copyright © 2016年 ddd. All rights reserved.
//

import UIKit

class EditTableViewController: UIViewController , UITableViewDataSource,UITableViewDelegate{

    var list = [String]()
    
    var action = 0
    
    
    @IBOutlet weak var deleteBn: UIBarButtonItem!
    @IBOutlet weak var addBn: UIBarButtonItem!
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = ["猪八戒","牛魔王","蜘蛛精","白骨精","狐狸精"]
        
        self.tableview.delegate = self
        self.tableview.dataSource = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let myId = "moveCell"
        var cell = tableview.dequeueReusableCellWithIdentifier(myId)
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: myId)
        }
        cell?.textLabel?.text = list[indexPath.row]
        return cell!
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return action == 0 ? .Delete : .Insert
    }
    
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "确认删除"
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        if list[indexPath.row] == "孙悟空"{
            return false
        }
        if (indexPath.row == 1) {
            return false
        }
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let sourceRowNo = sourceIndexPath.row
        let destRowNo = destinationIndexPath.row
        
        let targetObj = list[sourceRowNo]
        list.removeAtIndex(sourceRowNo)
        list.insert(targetObj, atIndex: destRowNo)
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            list.removeAtIndex(indexPath.row)
            tableview.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        if editingStyle == .Insert {
            list.insert(list[indexPath.row], atIndex: (indexPath.row + 1))
            tableview.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    @IBAction func toggleEdit(sender: UIBarButtonItem) {
        
        if sender.title == "删除" {
            action = 0
        } else {
            action = 1
        }
        tableview.setEditing(!tableview.editing, animated: true)
        
        if self.tableview.editing {
            addBn.title="完成"
            deleteBn.title = "完成"
        }else{
            addBn.title = "添加"
            addBn.title = "删除"
        }
        
    }
    
    
    
}
