//
//  User.swift
//  Autolayout
//
//  Created by adminstrator on 16/2/19.
//  Copyright © 2016年 ddd.cc. All rights reserved.
//

import Foundation

struct User {
    let name : String
    let company : String
    let login : String
    let password : String
    
    static func login(login: String , password: String) -> User? {
        if let user = database[login] {
            if user.password == password {
                return user
            }
        }
        return nil
    }
    
    static let database : Dictionary<String,User> = {
        var theDatavase = Dictionary<String,User>()
        
        for user in [
            User (name: "John Appleseed", company: "AppleAppleAppleApple", login: "japple", password: "foo"),
            User (name: "张三", company: "AlibabaAlibabaAlibabaAlibabaAlibabaAlibaba", login: "lisi", password: "foo"),
            User (name: "李四", company: "TencentTencentTencentTencent", login: "zhangsan", password: "foo"),
            User (name: "王五", company: "BaiduBaiduBaiduBaiduBaidu", login: "wangwu", password: "foo"),
            User (name: "美女", company: "hellohellohellohellohello", login: "11", password: "foo")
            ]{
                theDatavase[user.login] = user
        }
        
        return theDatavase
    }()
}

