//
//  SimpleTableViewController.swift
//  iOSUIControls
//
//  Created by adminstrator on 16/3/5.
//  Copyright © 2016年 ddd. All rights reserved.
//

import UIKit

class SimpleTableViewController: UIViewController , UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    
    
    var books = [String]()
    var details = [String ]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        books = ["林志玲", "刘亦菲","高圆圆", "柳岩"]
        
        details = ["女神女神", "女神女神女神","女神", "。。。。"]
        
        self.table.dataSource = self
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellId = "cellId"
        var cell = table.dequeueReusableCellWithIdentifier("cellId")
        
        if cell == nil {
            
            switch(indexPath.row % 4 ){
            case 0 :
                cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
            case 1:
                cell = UITableViewCell(style: .Default, reuseIdentifier: cellId)
            case 2:
                cell = UITableViewCell(style: .Value1, reuseIdentifier: cellId)
            case 3:
                cell = UITableViewCell(style: .Value2, reuseIdentifier: cellId)
            default:
                break
            }
        }
        cell?.layer.cornerRadius = 12
        cell?.layer.masksToBounds = true
        let rowNo = indexPath.row
        cell?.textLabel?.text = books[rowNo]
        cell?.imageView?.image = UIImage(named: "coffie")
        cell?.imageView?.highlightedImage = UIImage(named: "selected-coffie")
        
        cell?.detailTextLabel?.text = details[rowNo]
        
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    
}
