//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



class Person {
    let name:String
    
    init(name:String){
        self.name = name
        print("\(name) is being initialized")
    }
    deinit{
        print("\(name) is being deinitialized")
    }
}

var reference1 :Person?
var reference2 :Person?
var reference3:Person?

reference1 = Person(name: "John Appleseed")
reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
reference3 = nil


//类实例之间的循环强引用

class PersonNew {
    let name : String
    init(name: String){self.name = name}
    var apartment : Apartment?
    deinit {print("\(name) is being deinitialized")
}
}

class Apartment {
    let unit :String
    init(unit : String) { self.unit = unit}
    weak var tenant : PersonNew?
    deinit { print("Apartment \(unit) is being deinitialized")}
    }
    
var john :PersonNew?
var unit4A : Apartment?

john = PersonNew(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john?.apartment = unit4A
unit4A?.tenant = john

john = nil
unit4A = nil



class Customer {
    let name :String
    var card:CreditCard?
    init(name:String){
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number :UInt64
    unowned let customer :Customer
    init(number:UInt64, customer : Customer){
        self.number = number;
        self.customer = customer
    }
    
    deinit{
        print("Card #\(number) is being deinitialized")
    }
}

var peter : Customer?
peter = Customer(name: "Peter Smith")
peter!.card = CreditCard(number: 1341_2424_24243-34, customer: peter!)

peter = nil


//无主引用及隐式解析可选属性

class Country {
    let name : String
    var capitalCity : City!
    init(name:String ,  capitalName:String){
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name :String
    unowned let country :Country
    init(name: String, country: Country){
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")


//闭包引起的循环强引用

class HTMLElement {
    
    let name:String
    let text :String?
    lazy var asHTML :Void -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        }else{
            return "<\(self.name) />"
        }
    }
    
    init (name :String, text:String? = nil){
        self.name = name
        self.text = text
    }
    
    deinit{
        print("\(name) is being deinitialized")
    }
}
/*
let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())
*/

var paragraph : HTMLElement? = HTMLElement(name: "p", text: "hello world")
print(paragraph!.asHTML())

paragraph = nil












































