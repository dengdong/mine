//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// 基础知识

let arr = [1,2,4]
let brr = arr.map{ "NO" + String( $0)}
brr



let arr1 = [[1,2,3],[4,5,6]]
let brr1 = arr1.flatMap{ $0 }
brr1

Array( arr1.map{ $0 }.flatten() )

let arr2 : [Int?] = [1,2,nil,4,nil,5]
let brr2 = arr.flatMap{$0}
brr2


//Optional中的map和flatMap

let a1 : Int? = 3
let b1 = a1.map{return $0 * 3}
b1

let a2 : Int? = nil
let b2 = a2.map{ $0 * 2}
b2


let s : String? = "abc"
let v = s.flatMap{ (a:String) -> Int? in
    return Int(a)
}

v

