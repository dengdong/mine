//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//属性要求
protocol FullyNamed {
    var fullName : String {get}
}

struct  Person : FullyNamed {
    var fullName : String
}

let john  = Person(fullName: "John Appleseed")

john.fullName


class Starship: FullyNamed {
    var prefix : String?
    var name: String
    init(name: String, prefix: String?=nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName : String {
        return (prefix != nil ? prefix! + " " :"") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
ncc1701.fullName


//方法要求

protocol RandomNumberGenerator {
    func random () -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom*a + c) % m)
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
generator.random()
generator.random()


//Mutating 方法要求

protocol Togglable {
    mutating func toggle()
}


enum OnOffSwitch :Togglable {
    case Off,On
    mutating func toggle() {
        switch self {
        case .Off:
            self = .On
        case .On:
            self = .Off
        }
    }
}
var lightSwitch = OnOffSwitch.Off
lightSwitch.toggle()

//构造器



//协议作为类型

class Dice {
    let sides :Int
    let generator : RandomNumberGenerator
    init(sides :Int, generator: RandomNumberGenerator){
        self.sides = sides
        self.generator = generator
    }
    
    func roll () -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}


var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}


//委托（代理）模式

protocol DiceGame {
    var dice :Dice {get}
    func play ()
}

protocol DiceGameDelegate {
    func gameDidStart(game : DiceGame)
    func game(game:DiceGame,disStartNewTurnWithDiceRoll diceRoll : Int)
    func gameDidEnd(game:DiceGame)
}


class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board :[Int]
    init(){
        board = [Int](count:finalSquare+1, repeatedValue:0)
        board[03]  = +08; board[06] = +11;board[09] = +09;board[10] = +02;
        board[14] = -10;board[19] = -11;board[22] = -2;board[24] = -8;
    }
    var delegate : DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, disStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}

class DiceGameTracker : DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes And Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice ")
    }
    func game(game: DiceGame, disStartNewTurnWithDiceRoll diceRoll: Int) {
        ++numberOfTurns
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns ")
    }
}

let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()



//通过扩展添加协议一致性

protocol TextRepresentable {
    var textualDescription : String {get}
}

extension Dice : TextRepresentable {
    var textualDescription : String {
        return "A \(sides) -sided dice"
    }
}
let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
print(d12.textualDescription)
extension SnakesAndLadders : TextRepresentable {
    var textualDescription : String {
        return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
}

print(game.textualDescription)


//通过扩展采纳协议

struct  Hamster {
    var name : String
    var textualDescription : String {
        return "A hamster named \(name)"
    }
}
extension Hamster : TextRepresentable {}

let simeonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable :TextRepresentable = simeonTheHamster
somethingTextRepresentable.textualDescription

//协议类型的集合

let things:[TextRepresentable] = [game, d12, simeonTheHamster]
print("协议类型的集合")
for thing in things {
    print(thing.textualDescription)
}

//协议的继承

protocol PrettyTextRepresentable : TextRepresentable {
    var prettyTextRepresentable : String {get}
}


extension SnakesAndLadders : PrettyTextRepresentable {
    var prettyTextRepresentable : String {
        var output = textualDescription + ":\n"
        for index in 1...finalSquare {
            switch board [index] {
            case let ladder where ladder > 0:
                output += "▲ "
            case let ladder where ladder < 0:
                output += "▼ "
            default :
                output += "○ "
            }
        }
        return output
    }
}
game.prettyTextRepresentable

//类类型专属协议
protocol SomeClassOnlyProtocol : class {
    var test:String {get}
}
/*
enum EnumTest : SomeClassOnlyProtocol {
    var test : String
}*/


//协议合成
protocol Named {
    var name : String {get}
}

protocol Aged {
    var age : Int {get}
}

struct PersonNew : Named, Aged {
    var name : String
    var age : Int
}

func wishHappyBirthday(celebrator: protocol<Named, Aged>){
    print("Happy birthday \(celebrator.name) - you're \(celebrator.age)!")
}
let birthdayPerson = PersonNew(name: "Malcolm", age: 21)
wishHappyBirthday(birthdayPerson)


//检查协议一致性

protocol HasArea {
    var area :Double {get}
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius : Double
    var area : Double {
        return pi * radius
    }
    init(radius : Double){
        self.radius = radius
    }
}

class Country: HasArea {
    var area : Double
    init(area : Double){
        self.area = area
    }
}

class Animal {
    var legs : Int
    init(legs : Int){
        self.legs = legs
    }
}

let objects : [AnyObject] = [
Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]

for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Something that doesn't have an area")
    }
}


//可选的协议要求

@objc protocol CounterDataSource {
    optional func incrementForCount(count:Int) -> Int
    optional var fixedIncrement : Int{get}
}

class Counter  {
    var count = 0
    var dataSource : CounterDataSource?
    func increment() {
        if let amount  = dataSource?.incrementForCount?(count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}

class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement = 3
}

var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}

@objc class TowardsZeroSource : NSObject, CounterDataSource {
    func incrementForCount(count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}

counter = Counter()
counter.count = -4
counter.dataSource = TowardsZeroSource()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}


//协议扩展

extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}
let generator1 = LinearCongruentialGenerator()
generator1.random()
generator1.randomBool()
































































