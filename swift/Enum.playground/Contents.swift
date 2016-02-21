//: Playground - noun: a place where people can play

import UIKit


enum CompassPoint{
    case North
    case South
    case East
    case West
}

enum Planet {
    case Mercury, Venus, Earth,Mars,Jupiter, Saturn, Uranus, Neptune
}

var directionToHead = CompassPoint.West
directionToHead = .East

//使用switch语句匹配枚举值
directionToHead = .South

switch directionToHead {
case .North:
    print("Lot of planets have a north")
case .South:
    print("Watch out for penguins")
case .East:
    print("Where the sun rises")
case .West:
    print("Where the skies are blue")
}

//关联值(Associated Values)

enum Barcode {
    case UPCA(Int,Int,Int,Int)
    case QRCode(String)
}

 var productBarcode = Barcode.UPCA(8, 24325, 24234, 3)
productBarcode = .QRCode("ABCDEFG")

switch productBarcode {
case .UPCA(let numberSystem,let manufacturer, let product, let check):
    print("UPC-a:\(numberSystem), \(manufacturer),\(product),\(check)")
case .QRCode(let productCode):
    print("QR Code :\(productCode)")
}


//原始值
enum ASCIIControlCharacter :Character {
    case Tab = "\t"
    case LinFeed = "\n"
    case CarriageReturn = "\r"
}

//原始值的隐式赋值
enum Planet1 : Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn , Uranus, Neptune
}

enum CompassPoint1 :String {
    case North , South, East , West
}
CompassPoint1.North.rawValue

Planet1.Venus.rawValue

//使用原始值初始化枚举实例(Initializing from a Raw Value)

let possiblePlanet = Planet1(rawValue: 7)

let positionToFind = 9
if let somePlanet = Planet1(rawValue: positionToFind){
    switch somePlanet {
    case .Earth:
        print("Mostly harmless")
    default:
        print("Not a safe place of humans ")
    }
}else{
    print("There isn't a planet at position \(positionToFind)")
}


//递归枚举
//在枚举成员前加上 indirect 表示成员可递归
//或在枚举类型开头加上 indirect

indirect enum ArithmeticExpression {
    case Number (Int)
    case Addtion(ArithmeticExpression, ArithmeticExpression)
    case Multiplication (ArithmeticExpression, ArithmeticExpression)
}

func evaluate(expression:ArithmeticExpression) -> Int {
    switch expression {
    case.Number(let value):
        return value
    case .Addtion(let left, let right):
        return evaluate(left) + evaluate(right)
    case .Multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}

let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addtion(five, four)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))
print(evaluate(product))















































