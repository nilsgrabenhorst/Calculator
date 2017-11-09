//
//  ViewController.swift
//  ProCalc
//
//  Created by Nils Grabenhorst on 08.11.17.
//  Copyright © 2017 SinnerSchrader Swipe. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
	
	@IBOutlet weak var resultLabel: UILabel!
	
	private var expressionBuilder = ExpressionBuilder()
	private var displayNumber: Double = 0 {
		didSet {
			resultLabel.text = String(displayNumber)
		}
	}
	private var isDisplayingResult = false
	
	@IBAction func digitTapped(_ sender: UIButton) {
		
		guard
			let digitString = sender.currentTitle,
			let digit = Double(digitString)
		else { return }
		
		if isDisplayingResult {
			isDisplayingResult = false
			displayNumber = 0
		}
		
		displayNumber = displayNumber * 10 + digit
	}
	
	@IBAction func operatorTapped(_ sender: UIButton) {
		guard
			let opString = sender.currentTitle
		else { return }
		
		expressionBuilder.append(displayNumber)
		displayNumber = 0
		resultLabel.text = opString
		
		if let op = BinaryOperator(rawValue: opString) {
			expressionBuilder.append(op)
		} else if opString == "=" {
			displayNumber = expressionBuilder.expression?.evaluate() ?? 0
			expressionBuilder.reset()
			isDisplayingResult = true
		}
	}
}

