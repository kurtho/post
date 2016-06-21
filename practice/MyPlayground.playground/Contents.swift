//: Playground - noun: a place where people can play

import UIKit

protocol Flyable {
    var wings: Int {get}
    func fly()
}

struct Bird: Flyable {

    enum Color {
        case Yellow
        case Black
        case White
    }
    
    var size:String = "small"
    var wings:Int = 2
    var color:Color = .Black
    func fly() {
        print("this bird can fly")
    }
}
var waterBird = Bird(size: "medium", wings: 2, color: .Black)
waterBird


let flyable: Flyable = Bird()
flyable.fly()

var outStr = "1234"
outStr


