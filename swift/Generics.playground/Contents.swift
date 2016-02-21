//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//泛型函数

func swapTowValues<T>(inout a:T, inout _ b: T){
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swap(&someInt, &anotherInt)
someInt
anotherInt

var someString = "Hello"
var anotherString = "world"
swap(&someString, &anotherString)
someString
anotherString


//泛型类型

struct Stack<Element> {
    var items = [Element]()
    mutating func push(item:Element){
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")

stackOfStrings.pop()


//扩展一个泛型类型

extension Stack{
    var topItem : Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

if let topItem = stackOfStrings.topItem {
    print("The top item on the stack is \(topItem)")
}


//类型约束

func findIndex<T : Equatable >(array:[T], _ valueToFind:T) -> Int? {
    for (index, value ) in array.enumerate() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let doubleIndex = findIndex([3.1415,0.1,0.25], 9.3)

let stringIndex = findIndex(["Mike","Malcolm", "Andrea"], "Andrea")


//关联类型
//关联类型作为协议的一部分，为某个类型提供一个占位名，代表的实际类型在协议被采纳时才会被指定。 typealias


protocol Container {
    typealias ItemType
    mutating func append(item:ItemType)
    var count:Int { get}
    subscript(i:Int) -> ItemType{get}
}

struct IntStack : Container {
    var items = [Int]()
    mutating func push(item:Int){
        items.append(item)
    }
    mutating func pop () -> Int {
        return items.removeLast()
    }
    
    typealias ItemType = Int
    mutating func append(item: ItemType) {
        self.push(item)
    }
    var count :Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

//Where子句

func allItemsMatch < C1 : Container, C2: Container
    where C1.ItemType == C2.ItemType, C1.ItemType:Equatable>
    (someContainer:C1, _ anotherContainer : C2) -> Bool {
        
        if someContainer.count != anotherContainer.count {
            return false
        }
        
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }
        return true
}





























































