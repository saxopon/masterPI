//
//  ViewController.swift
//  PiMaster
//
//  Created by Elektra Wrenholt on 6/21/15.
//  Copyright (c) 2015 Elektra Wrenholt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
	@IBOutlet weak var highScore: UILabel!
	
    @IBAction func appendDigit(sender: UIButton) {
        // get digit from button
        let digit = sender.currentTitle!
		
		let piDigit = numPi[numPi.startIndex]
		
		// check against pi
		if digit ==  String(piDigit) {
			
			numPi.removeAtIndex(numPi.startIndex)
			
			// add digit to array
			let toAdd = NSNumberFormatter().numberFromString(digit)!.integerValue
			userEntry.append(toAdd)
			
			// add digit to label
			label.text = label.text! + digit
			
			score++
		}
		else {
			// find next 3 digits:
			let nextDigits = (numPi as NSString).substringToIndex(5)
			
			// show alert
			let alertController = UIAlertController(title: "Score: \(self.score)", message:"The next digits of pi are \(nextDigits)", preferredStyle: UIAlertControllerStyle.Alert)
			
			let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default) {
				UIAlertAction in
				self.reset()
			}
			
			alertController.addAction(okAction)
			
			self.presentViewController(alertController, animated: true, completion: nil)
		}
	}
	
    var userEntry = Array<Int>()
	
	var numPi = "141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117067982148086513282306647093844609550582231725359408128481117450284102701938521105559644622948954930381964428810975665933446128475648233786783165271201909145648566923460348610454326648213393607260249141273724587006606315588174881520920962829254091"
	
	var score = 0
	var recordScore = 0
	
	func reset() {
		numPi = "141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117067982148086513282306647093844609550582231725359408128481117450284102701938521105559644622948954930381964428810975665933446128475648233786783165271201909145648566923460348610454326648213393607260249141273724587006606315588174881520920962829254091"
		label.text = "3."
		
		if (score > recordScore) {
			recordScore = score
			self.highScore.text = "High Score: \(self.score) digits"
		}
		
		score = 0
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

