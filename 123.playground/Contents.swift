//: Playground - noun: a place where people can play

import UIKit

class Person {
    let name: String
    var age = 18
    let height: Float
    
    var bmi: Float
    
    init(name: String, age: Int, height: Float, weigth: Float, bmi: Float) {
        self.name = name
        self.age = age
        self.height = height
        self.bmi = bmi
        
    }
}




var put = Int()

var ttt = ""

var arr = [Int]()

arr.append(1)
arr
arr.append(2)
arr



var guessString = ["1,2,3"]
var hint = "2a2b"




var


let brian = Person(name: "Brian", age: 26, height: 168, weigth: 60, bmi: 60/(1.68*1.68))






class GameRun {
    
    var putInArr: [Int]
    var poutStr: String
    
    init(putInArr: [Int], outStr: String ){
        self.putInArr = putInArr
        self.poutStr = outStr
        
    }
}
let run = GameRun(putInArr: [0], outStr: "")

