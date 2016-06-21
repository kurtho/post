//
//  ViewController.swift
//  BullsAndCows
//
//  Created by Brian Hu on 5/19/16.
//  Copyright © 2016 Brian. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,GameRun {
        
    
    
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var remainingTimeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var answearLabel: UILabel!
    var remainingTime: UInt8! {
        didSet {
            remainingTimeLabel.text = "remaining time: \(remainingTime)"
            if remainingTime == 0 {
                guessButton.enabled = false
            } else {
                guessButton.enabled = true
            }
        }
    }
    
    var hintArray = [(guess: String, hint: String)]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    
    var putInArr = [Int]()
    var outStr = String()
//    var answear: UInt16!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGame()
        
    }
    
    func setGame() {
        generateAnswear()
        remainingTime = 9
        hintArray.removeAll()
        //        hintArray = []
        answearLabel.text = nil
        guessTextField.text = nil
        self.remainingTimeLabel.textColor = UIColor.blackColor()
        
    }
    
    var arrInput = [Int]()
    
    
    func generateAnswear() -> [Int]{
        outStr = ""
        putInArr.removeAll()

        print("61 : \(putInArr)")
        var arrNumbs = [1,2,3,4,5,6,7,8,9,0]

        while putInArr.count < 4 {
            
            let arc = arc4random_uniform(10) + 1
            if Int(arc) == arrNumbs[Int(arc) - 1] {
                arrNumbs[Int(arc) - 1] = -1
                putInArr.append(Int(arc))
                outStr += String(arc)
            }
        }
        print("72 : \(putInArr)")

        return putInArr
        // TODO: 2. generate your answear here
        // You need to generate 4 random and non-repeating digits.
        // Some hints: http://stackoverflow.com/q/24007129/938380
    }
    
    var keyInArr = [Int]()
    
    @IBAction func guess(sender: AnyObject) {
        let guessString = guessTextField.text
        
        
        
        guard guessString?.characters.count == 4 else {
            let alert = UIAlertController(title: "you should input 4 digits to guess!", message: nil, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
        //need help
        
        if Set(guessString!.characters).count < 4 {
            let alert = UIAlertController(title: "you should put different digits to guess!", message: nil, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
        
        
        
        
        let thousand = Int(guessString!)! / 1000
        let houndred = Int(guessString!)! / 100 - thousand * 10
        let ten = Int(guessString!)! / 10 - thousand * 100 - houndred * 10
        let one = Int(guessString!)! - thousand * 1000 - houndred * 100 - ten * 10
        keyInArr = [thousand, houndred, ten, one]
        
        //         TODO: 3. convert guessString to the data type you want to use and judge the guess
        
        
        
        var scan = 0
        var a = 0
        var b = 0
        for _ in 0...3 {
            if keyInArr[scan] == putInArr[scan] {
                a += 1
            }
            scan += 1
        }
        
        var secScan = 0
        var thdScan = 0
        
        
        while thdScan != 4 {
            if keyInArr[secScan] == putInArr[thdScan] {
                b += 1
                secScan += 1
            }else if keyInArr[secScan] != putInArr[thdScan] {
                secScan += 1
            }
            if secScan == 4 {
                secScan = 0
                thdScan += 1
            }
        }
        
        if a > b {
            b = a - b
        }else if b > a {
            b = b - a
        }else if a == 4 {
            b = 0
        }
        
        // TODO: 4. update the hint
        //        let hint = "1A2B"
        let hint = "\(a)A  \(b)B"
        hintArray.append((guessString!, hint))
        
        // TODO: 5. update the constant "correct" if the guess is correct
        
        var correct = false
        if outStr == guessString {
            correct = true
        }
        if correct {
            let alert = UIAlertController(title: "Wow! You are awesome!", message: nil, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            guessButton.enabled = false
        } else {
            remainingTime! -= 1
            if remainingTime <= 3 {
                self.remainingTimeLabel.textColor = UIColor.redColor()
            }else if remainingTime <= 6 {
                self.remainingTimeLabel.textColor = UIColor.yellowColor()
            }
        }
    }
    
    
    
    @IBAction func showAnswear(sender: AnyObject) {
        // TODO: 6. convert your answear to string(if it's necessary) and display it
        answearLabel.text = "\(outStr)"
        
    }
    
    @IBAction func playAgain(sender: AnyObject) {
        setGame()
    }
    
    // MARK: TableView
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hintArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Hint Cell", forIndexPath: indexPath)
        let (guess, hint) = hintArray[indexPath.row]
        cell.textLabel?.text = "\(guess) => \(hint)"
        return cell
    }
}



