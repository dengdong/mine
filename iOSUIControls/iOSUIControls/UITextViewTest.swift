//
//  UITextViewTest.swift
//  iOSUIControls
//
//  Created by adminstrator on 16/3/3.
//  Copyright © 2016年 ddd. All rights reserved.
//

import UIKit

/*
1. 导航按钮关闭虚拟键盘
2. 自定义键盘附件关闭虚拟键盘
3. 自定义选中内容后的菜单
*/
class UITextViewTest: UIViewController , UITextViewDelegate {

    @IBOutlet weak var textview: UITextView!
    
    var done: UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textview.delegate = self
        
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: 320, height: 44))
        
        
        self.view.addSubview(navBar)
        
        self.navigationItem 
        
        let item = UINavigationItem(title: "导航条")
        
        navBar.items?.append(item)
        done = UIBarButtonItem(barButtonSystemItem:.Done, target: self, action: Selector("finishEidt"))
    
    
        /*
        创建虚拟键盘
        */
        var topView = UIToolbar(frame: CGRect(x: 9, y: 0, width: 320, height: 35))
        //设置工具条风格
        topView.barStyle = .Default
        //第一个按钮
        var myBn = UIBarButtonItem(title: "无工作", style: .Bordered, target: self, action: nil)
        //第二个按钮
        let spaceBn = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: self, action: nil)
        //第三个按钮
        let doneBn = UIBarButtonItem(title: "完成", style: .Done, target: self, action: Selector("finishEidt"));
        topView.items = [myBn,  spaceBn, doneBn]
        self.textview.inputAccessoryView = topView
        
        
        /*创建选择菜单*/
        let mailShare = UIMenuItem(title: "邮件分享", action: Selector("mailShare:"))
        let weiboShare = UIMenuItem(title: "微博分享", action: Selector("weiboShare:"))
        
        let menu = UIMenuController.sharedMenuController().menuItems = [mailShare, weiboShare]
        
        
    }
    
    override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        if action == Selector("mailShare:") || action == Selector("weiboShare:") {
            if textview.selectedRange.length > 0{
                return true
            }
        }
        return false
    }
    
    
    func mailShare(sender:UIMenuItem){
        print("模拟邮件分享！")
    }
    func weiboShare(sender:UIMenuItem){
        print("模拟微博分享")
    }
    
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        self.navigationItem.rightBarButtonItem = done
        return true
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        self.navigationItem.rightBarButtonItem = nil
    }
    
    func finishEidt(){
        textview.resignFirstResponder()
    }
    
}
