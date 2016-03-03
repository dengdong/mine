//
//  ViewController.swift
//  Todo
//
//  Created by adminstrator on 16/2/27.
//  Copyright © 2016年 ddd.cc. All rights reserved.
//

import UIKit

var todoItems = [TodoModel]()
var filterItems :[TodoModel] = []

func dateFromString(dateStr : String ) -> NSDate? {
    let format = NSDateFormatter()
    format.dateFormat = "yyyy-MM-dd"
    return format.dateFromString(dateStr)
}

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate , UISearchResultsUpdating {

    @IBOutlet weak var tableview: UITableView!
    var searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        todoItems = [
        TodoModel(id: "1", image: "selected-child", title: "1.接小孩放学", date: dateFromString("2015-10-01")!),
                    TodoModel(id: "2", image: "selected-coffie", title: "2.喝咖啡", date: dateFromString("2015-10-02")!),
                    TodoModel(id: "3", image: "selected-phone", title: "3.打电话", date: dateFromString("2015-10-03")!),
                    TodoModel(id: "4", image: "selected-shopping-cart", title: "4.购物", date: dateFromString("2015-10-04")!)
        ]
        
        tableview.dataSource = self
        
        navigationItem.leftBarButtonItem = editButtonItem()
    
        searchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()

            return controller
        })()
        
        tableview.tableHeaderView = searchController.searchBar
        
        tableview.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK - UITableViewDataSource
    
   
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchController.active {
            return filterItems.count
        }
        return todoItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("todoCell")
        
        var  model = todoItems[indexPath.row]
        
        if searchController.active {
         model = filterItems[indexPath.row]
        }
        
        let imageField = cell?.viewWithTag(101) as? UIImageView
        let titleField = cell?.viewWithTag(102) as? UILabel
        let dateField = cell?.viewWithTag(103) as? UILabel
        
        imageField?.image = UIImage(named: model.image)
        titleField?.text = model.title
        
        
        let locale = NSLocale.currentLocale()
        let dateFormat = NSDateFormatter.dateFormatFromTemplate("yyyy-MM-dd", options: 0, locale: locale)
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateField?.text =  dateFormatter.stringFromDate(model.date)
        
        return cell!
    }

    // MARK - UITableViewDataDelegate
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        todoItems.removeAtIndex(indexPath.row)
        tableview.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return editing
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let todo = todoItems.removeAtIndex(sourceIndexPath.row)
        todoItems.insert(todo, atIndex: destinationIndexPath.row )
    }
    
    //Edit Mode
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableview.setEditing(editing, animated: animated)
    }
    
    
    // Search 
    /*
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String?) -> Bool {
        
        filterItems = todoItems.filter{ $0.title.rangeOfString(searchString ?? "") != nil }
        
        
        return true
    }
    */
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterItems = todoItems.filter{ $0.title.rangeOfString(searchController.searchBar.text ?? "") != nil }
        tableview.reloadData()
    }
    

    
    
    @IBAction func close(segue : UIStoryboardSegue) {
        print("closed")
        tableview.reloadData()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if identifier == "editTodo" {
                if let vc = segue.destinationViewController as? DetailViewController {
                    let indexPath = tableview.indexPathsForSelectedRows
                    if let index = indexPath {
                        vc.todo = todoItems[index[0].row]
                    }
                }
            }
        }
    }
    
}

