//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Person {
    var residence : Residence?
}

class Room {
    let name :String
    init(name:String){
        self.name=name
    }
}

class Address  {
    var buildingName :String?
    var buildNumber:String?
    var street:String?
    
    func buildingIdentitfier() ->String?{
        if buildingName != nil{
            return buildingName
        }else if buildNumber != nil && street != nil{
            return "\(buildNumber) \(street)"
        }else{
            return nil
        }
        
    }
}

class  Residence {
    var rooms = [Room]()
    
    var numberOfRooms :Int {
        return rooms.count
    }
    
    subscript(i:Int) ->Room{
        get{
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    
    func printNumberOfRooms(){
        print("The number of rooms is \(numberOfRooms)")
    }
    
    var address : Address?
}

//通过可选链式调用访问属性
let john = Person()
if let roomCount = john.residence?.numberOfRooms{
    print("John's residence has \(roomCount) room(s).")
}else{
    print("Unable to retrieve the number of fooms")
}

//通过可选链式调用 设置属性值
let someAddress = Address()
someAddress.buildNumber = "29"
someAddress.street = "Acacia Road"
john.residence?.address = someAddress


func createAddress() ->Address{
    print("Function was called.")
    let someAddress = Address()
    someAddress.buildNumber = "29"
    someAddress.street = "Acacia Road"
    return someAddress
}
john.residence?.address = createAddress()

//通过可选链式调用方法
if john.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
}else{
    print("It was not possible to print the number of rooms.")
}

if (john.residence?.address = someAddress) != nil {
    print("It was possible to set the address")
}else{
    print("It was not possible to set the address.")
}


//通过可选链式调用访问下标
if let firstRoomName = john.residence?[0].name{
    print("The first room name is \(firstRoomName)")
} else {
    print("Unable to retrieve the first room name.")
}

let johnsHouse = Residence()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
john.residence = johnsHouse

if let firstRoomName = john.residence?[0].name{
    print("The first room name is \(firstRoomName)")
} else {
    print("Unable to retrieve the first room name.")
}

//访问可选类型的下标
var testScores = ["Dave":[86,82,84],"Bev":[79,94,81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0]++
testScores["Brian"]?[0] = 72

testScores

//连接多层可选链式调用
if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}













































