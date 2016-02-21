//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class MediaItem {
    var name : String
    init(name : String ){
        self.name = name
    }
}

class Movie : MediaItem {
    var director : String
    init( name : String , director : String){
        self.director = director
        super.init(name: name)
    }
}

class Song : MediaItem {
    var artist : String
    init(name:String , artist: String)
    {
        self.artist = artist
        super.init(name: artist)
    }
}

var library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]


var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        ++movieCount
    } else  {
        ++songCount
    }
}

print("Medis library contains \(movieCount) movies and \(songCount) songs")


for item in library {
    if let movie = item as? Movie {
        print("Movie:'\(movie.name)', dir.\(movie.director)")
    } else if let song = item as? Song {
        print("Song:'\(song.name)', by\(song.artist)")
    }
}



//Any 和 AnyObject 类型转换

//Swift 为不确定类型提供了两种特殊的类型别名
// AnyObject 可以表示任何类型的实例
// Any 可以表示任何类型，包括函数类型



/*
*
*嵌套类型 Nested Types
*/
struct BlackjackCard {
    //嵌套的Suit枚举
    enum Suit : Character {
        case Spades = "♠", Hearts = "♡", Diamonds = "♢", Clubs = "♣"
    }
    
    //嵌套的Rank枚举
    enum Rank : Int {
        case Two = 2, Three, Four, Five , Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King, Ace
        struct  Values  {
            let first:Int, second :Int?
        }
        var values : Values {
            switch self {
            case .Ace :
                return Values(first: 1, second: 11)
            case .Jack, .Queen, .King:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    //BlackjackCard的属性和方法
    let rank : Rank, suit:Suit
    var description : String {
        var  output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
    
}

let theAceOfSpades = BlackjackCard(rank: .Ace, suit: .Spades)
print(theAceOfSpades.description)


BlackjackCard.Suit.Hearts.rawValue




/*
* 扩展(Extensions)
*/

//计算型属性

extension Double {
    var km :Double {return self * 1000.0}
    var m : Double {return self}
    var cm : Double {return self/100.0}
    var mm:Double {return self/1_000.0}
    var ft:Double { return self/3.28024 }
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")

let threeFeet = 3.ft

let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")

//构造器(Initializers)

struct Size {
    var width = 0.0,height=0.0
}
struct  Point {
    var x = 0.0,y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

extension Rect {
    init(center:Point, size:Size) {
        let originX = center.x - (size.width/2)
        let originY = center.y - (size.height / 2)
        self.init(origin:Point(x: originX, y: originY), size:size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size:  Size(width: 3.0, height: 3.0))

centerRect.origin.x


//方法(Methods)
extension Int {
    func repetitions(task:()->Void){
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions({
    print("Hello!")
})

//可变实例方法
extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt = 3
someInt.square()

//下标

extension Int {
    subscript(var digitIndex :Int ) -> Int {
        var decimalBase = 1
        while digitIndex > 0 {
            decimalBase  *= 10
            --digitIndex
        }
        return (self / decimalBase) % 10
    }
}

124124112[0]
52341[1]
1234125[2]
2[5]

//嵌套类型
extension Int {
    enum Kind {
        case Negative,Zero, Positive
    }
    
    var kind:Kind {
        switch self {
        case 0:
            return .Zero
        case let x where x > 0 :
            return .Positive
        default :
            return .Negative
        }
    }
}

func printIntegerKinds(numbers:[Int]) {
    for number in numbers {
        switch number.kind {
        case .Negative:
            print("- ", separator: " ", terminator: "")
        case .Zero:
            print("0 ", separator: " ", terminator: "")
        case .Positive:
            print("+ ", separator: " ", terminator: "")
        }
    }
    print("")
}
printIntegerKinds([-1,3,5,1,4,0,])











































