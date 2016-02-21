//: Playground - noun: a place where people can play

import UIKit



struct  Fahrenheit {
    var temperature:Double
    init(){
        temperature = 32.0
    }
}

var f = Fahrenheit()
print("The default temperature is \(f.temperature) Fahenheit")



class Vehicle {
    var numberOfWheels  = 0
    var description :String {
        return "\(numberOfWheels) wheel(s)"
    }
}

let vehicle = Vehicle()
print("Vehicle : \(vehicle.description)")

class Bicycle : Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
print("Bicycle : \(bicycle.description)")

/*
*指定构造器和遍历构造器实践
*/

class Food {
    var name : String
    init(name:String){
        self.name = name
    }
    convenience init(){
        self.init(name:"[Unnamed]")
    }
}



let food1 = Food()
food1.name

let food2 = Food(name: "Jack")
food2.name

class RecipeIngredient: Food {
    var quantity:Int
    init(name:String, quantity:Int){
        self.quantity = quantity
        super.init(name:name)
    }
    override convenience init(name:String){
        self.init(name:name, quantity:1)
    }
}


let oneMysteryItem = RecipeIngredient()
let onBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)


class ShoppingListItem :RecipeIngredient {
    var purchased = false
    var description :String {
        var output = "\(quantity) x \(name))"
        output += purchased ?"✔":"✘"
        return output
    }
}

var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name:"Bacon"),
    ShoppingListItem(name: "eggs", quantity: 6)
]
breakfastList[0].name="Orange juice"
breakfastList[0].purchased = true

var descStr = ""
for item in breakfastList {
    descStr += item.description
}
print(descStr)


























































































