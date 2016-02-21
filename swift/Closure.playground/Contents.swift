//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let names = ["Chris","Alex","Ewa", "Barry","Daniella"]

func backwards (s1:String, s2:String) -> Bool{
    return s1 < s2
}

names.sort(backwards)

//闭包表达式语法
names.sort({(s1:String,s2:String) -> Bool in
    return s1 < s2
})

//根据上下文推断类型

var reversed = names.sort({ s1, s2 in return s2 > s1})
print( reversed)

//单表达式闭包隐式返回
reversed = names.sort({s1,s2 in s1 < s2})
print( reversed)

//参数名称缩写
reversed = names.sort({$0 < $1})
print( reversed)


//运算符函数
reversed = names.sort(<)


//尾随闭包（Trailing Closures)
let digitNames=[
    0:"Sero",1:"one",2:"Two",3:"Three",4:"Four",5:"Five",
    6:"Six",7:"Seven",8:"Egiht",9:"Nine"
]

let numbers = [16,58,510]

numbers.map{
    (var number) -> String in
    var output=""
    while number > 0{
        output = digitNames[number%10]!+output
        number = number / 10
    }
    return output
}


//捕获值
func makeIncrementor(forInCrement amount:Int) -> ()->Int{
    var runningTotal = 0
    func increamentor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return increamentor
}

let incrementByTen = makeIncrementor(forInCrement: 10)

incrementByTen()
incrementByTen()
incrementByTen()
incrementByTen()































































































