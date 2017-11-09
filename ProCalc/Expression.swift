//
//  Expresion.swift
//  ProCalc
//
//  Created by Nils Grabenhorst on 08.11.17.
//  Copyright © 2017 SinnerSchrader Swipe. All rights reserved.
//

import Foundation

enum BinaryOperator: String {
	case
	addition = "+"
	, subtraction = "-"
	, multiplication = "×"
	, division = "÷"
	
	
	private var definitions: (f: (Double, Double) -> Double, precedence: Int) {
		switch self {
		case .addition: return (+, 10)
		case .subtraction: return (-, 10)
		case .multiplication: return (*, 20)
		case .division: return (/, 20)
		}
	}
	
	var evaluate: (Double, Double) -> Double { return definitions.f }
	var precedence: Int { return definitions.precedence }
}

indirect enum Expression {
	case
	binary(Expression, BinaryOperator, Expression),
	value(Double)
	
	func evaluate() -> Double {
		switch self {
		case .value(let v):
			return v
		case let .binary(lhs, op, rhs):
			return op.evaluate(lhs.evaluate(), rhs.evaluate())
		}
	}
	
	var precedence: Int {
		switch self {
		case .value:
			return Int.max
		case .binary(_, let op, _):
			return op.precedence
		}
	}
}

