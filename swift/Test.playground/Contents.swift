//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print("Hello,world")


var myVariable = 42
myVariable = 50
let myConstant = 42




let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble :Double = 70

let explicitFlout:Float = 4


let label = "The width is"
let width = 94
let widthLabel = label + String( width)


let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges ) pieces of fruit."


var shoppintList = ["catfish", "water", "tulips","blue paint"]
shoppintList[1] = "bottle of water"
shoppintList

var occupations = [
    "Malcolm":"Captain",
    "Kaylee":"Mechanic",
]

//创建一个空数组或者字典，使用初始化语法
let emptyArray = [String]()
let emptyDictionary=[String:Float]()

//控制流
//if 和 switch 来进行条件操作
// for-in ,for, while,repeat-while 进行循环
let individualScores = [75,42,103, 87, 12]
var teamScore = 0
for score in individualScores{
    if score > 50 {
        teamScore += 3
    }else {
        teamScore += 1
    }
}
print(teamScore)

var optionalString:String? = "Hello"
print(optionalString == nil)

var optionalName :String? = "John Appleseed"
//optionalName = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}else{
    greeting = "Hello````"
}

let nickName :String? = nil
let fullName :String = "John Appleseed"
let informalGreeting = "Hi, \(nickName ?? fullName)"



//switch 支持任意类型的数据以及各种比较操作 -- 不仅仅是整数以及测试相等


var vegetable = "red pepper"
switch vegetable{
    case "celery":
        print("Add some raisins and make ants on a log.")
    case "cucumber", "watercress":
        print("That would make a good tea sandwich")
case let x where x.hasSuffix("pepper"):
        print("Is it a spicy \(x)?")
default:
        print("Everything tastes good in soup")
}


//使用 for-in 遍历字典，
let interestingNumbers = [
    "Prime": [2,3,5,7,11,13],
    "Fibonacci":[1,1,2,3,5,8],
    "Square":[1,4,9,16,25],
]
var largest = 0
for (kind , numbers) in interestingNumbers{
    for number in numbers{
        if number > largest{
            largest = number
        }
    }
}
print(largest)

//while循环

var n = 2
while n < 100{
    n = n * 2
}
print(n)

var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)


///
var firForLoop = 0
for i in 0...4{
    firForLoop += i
}
print(firForLoop)

var secondForLoop = 0
for var i = 0 ; i < 4;++i {
    secondForLoop += i
}
print(secondForLoop)


//函数和闭包
//使用  -> 来指定函数返回值的类型
func greet(name:String, day:String)->String{
    return "Hello \(name), today is \(day)."
}
greet("Bob", day:"Tuesday")

//使用元组让一个函数返回多个值
func calculateStatistics(scores:[Int])->(min:Int, max:Int, sum:Int){
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores{
        if score > max{
            max = score
        }else{
            min = score
        }
        sum += score
    }
    return (min,max,sum)
}

let statistics = calculateStatistics([5,3,100,3,9])
print(statistics.sum)
print(statistics.2)
print(statistics.0)


//可变参数
func sumOf(numbers:Int...)->Int{
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(1,2,3,4,5,6)

//嵌套函数， 可以访问外侧函数的变量

func returnFifteen()->Int{
    var y = 10
    func add(){
        y += 5
    }
    add()
    return y
}
returnFifteen()

//函数可以作为另一个函数的返回值

func makeIncrementer()->(Int->Int){
    func addOne(number:Int)->Int{
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(8)

//函数作为参数

func hasAnyMatches(list:[Int], condition:Int -> Bool)->Bool{
    
    for item in list {
        if condition(item){
            return true
        }
    }
    return false
}

func lessThanTen(number:Int) -> Bool{
    return number < 10
}

var numbers = [20,19,8,1]
hasAnyMatches(numbers, condition: lessThanTen)

//使用 {} 创建一个匿名闭包

numbers.map({
    (number:Int) -> Int in
    let result = 3 * number
    return result
})

numbers.map({
    (number:Int) -> Int in
    if number % 2 != 0 {
        return 0
    }
    return number
})

//如果闭包的类型已知，回调函数可以忽略参数的类型和返回值
let mappedNumbers = numbers.map({ number in 3 * number})
print(mappedNumbers)

let sortedNumbers = numbers.sort{$0 > $1}
print(sortedNumbers)


//对象和类

class Shape{
    var numberOfSides = 0
    func simpleDescrietion() -> String{
        return "A shape with \(numberOfSides) sides."
    }
}

var shape = Shape()
shape.numberOfSides = 7
shape.simpleDescrietion()

//使用init 创建一个构造器
class NamedShape{
    var numberOfSides :Int = 0
    var name:String
    
    init (name:String){
        self.name = name
    }
    
    func simpleDescription () -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: NamedShape {
    var sideLength :Double
    
    init(sideLength:Double, name:String){
        self.sideLength = sideLength
        super.init(name:name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
    
}

let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()


class Circle : NamedShape {
    var radius : Double = 0.0
    
    init(radius : Double , name:String){
        self.radius = radius
        super.init(name: name)
        numberOfSides = 0
    }
    
    func area () -> Double {
        return 3.14 * radius * radius
    }
    
    override func simpleDescription() -> String {
        return "A circle with radius \(radius)"
    }
    
}

var testCirle = Circle(radius: 5, name: "afd")
test.area()
test.simpleDescription()


//getter setter

class EquilateralTriangle: NamedShape {
    var sideLength : Double = 0.0
    
    init(sideLength : Double, name:String){
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter:Double{
        get{
            return 3.0 * sideLength
        }
        set{
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triagle with sides of length \(sideLength)"
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

//willSet / didSet

class TriangleAndSquare {
    var triangle: EquilateralTriangle{
        willSet{
            square.sideLength = newValue.sideLength
        }
    }
    var square :Square{
        willSet{
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size:Double, name:String){
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "Large square")
print(triangleAndSquare.triangle.sideLength)


//枚举和结构体
enum Rank : Int{
    case Ace = 1
    case Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten
    case Jack,Queen,King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "Ace"
        case  .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Queen
let aceRawValue = ace.rawValue

func compareRank(rank1:Rank, rank2:Rank)->Bool{
    if rank1.rawValue > rank2.rawValue{
        return true
    }
    return false
}
compareRank(Rank.Queen,rank2: Rank.Jack)

//使用 init?(rawValue:) 初始化构造器在原始值和枚举值之间进行转换
if let convertedRank = Rank(rawValue: 13){
    let threeDescription = convertedRank.simpleDescription()
}


enum Suit{
    case Spades, Hearts, Diamonds, Clubs
    
    func simpleDescription() -> String {
        switch self {
        case .Spades :
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
    func color()->String{
        switch self {
        case .Spades,.Clubs:
            return "black"
        case .Hearts, .Diamonds:
            return "red"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()
hearts.color()


struct Card {
    var rank :Rank
    var suit :Suit
    
    func simpleDescription() -> String{
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()


enum ServerResponse{
    case Result(String,String)
    case Error(String)
}
let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese.")
switch success{
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at\(sunrise) and sunset is at\(sunset)"
case let .Error(error):
    let serverResponse = "Failure...\(error)"
}

//协议和扩展
protocol ExampleProtocol{
    var simpleDescription:String{get}
    mutating func adjust()
}
//类、枚举和结构体都可以实现协议
class SimpleClass : ExampleProtocol{
    var simpleDescription:String = "A very simple class."
    var anotherProperty :Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted"
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure:ExampleProtocol{
    var simpleDescription :String = "A simple structure"
    mutating func adjust() {
        simpleDescription += "(adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription =  b.simpleDescription

enum SimpleEnum : ExampleProtocol{
    var simpleDescription :String {
        get{
            switch self {
            case .One:
                return "one"
            case .Two :
                return "two"
            case .Three:
                return "three"
            case .Four:
                return "four"
            }
        }
        set {
            switch self {
            case .One:
                self = .One
            case .Two :
                self = .Two
            case .Three:
                self = .Three
            case .Four :
                self = .Four
            }
        }
    }
    
    mutating func adjust() {
        
    }
    
    case One,Two,Three,Four
    
    
    
    
}


//extension

extension Int :ExampleProtocol{
    var simpleDescription:String{
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
7.simpleDescription

extension Double{
    func  absoluteValue()->Double{
        return abs(self)
    }
}
(-5.0).absoluteValue()











































