//
//  ExpressionBuilder.swift
//  ProCalc
//
//  Created by Nils Grabenhorst on 08.11.17.
//  Copyright © 2017 SinnerSchrader Swipe. All rights reserved.
//

import Foundation

struct ExpressionBuilder {
	private (set) var expression: Expression?
	private var pendingNumber: Double?
	private var pendingOperator: BinaryOperator?
	
	mutating func append(_ number: Double) {
		pendingNumber = number
		updateExpression()
	}
	
	mutating func append(_ op: BinaryOperator) {
		pendingOperator = op
		updateExpression()
	}
	
	mutating func reset() {
		pendingNumber = expression?.evaluate()
		expression = nil
		pendingOperator = nil
	}
	
	private mutating func updateExpression() {
		switch (expression, pendingOperator, pendingNumber) {
		case (nil, _, let n?):
			expression = .value(n)
			pendingNumber = nil
			
		case (_, _, nil):
			break
			
		case let (e?, o?, n?) where e.precedence >= o.precedence:
			expression = .binary(e, o, .value(n))
			pendingNumber = nil
			pendingOperator = nil
			
		case let (.binary(v1, eOp, v2)?, o?, n?):
			expression = .binary(v1, eOp, .binary(v2, o, .value(n)))
			pendingNumber = nil
			pendingOperator = nil
			
		default:
			assertionFailure("Missing a case? e: \(String(describing: expression)), o: \(String(describing: pendingOperator)), n: \(String(describing: pendingNumber))")
			break
		}
	}
}

