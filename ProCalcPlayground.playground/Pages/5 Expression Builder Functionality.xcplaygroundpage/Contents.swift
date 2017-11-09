/*: [Previous](@previous)
# Adding Functionality to ExpressionBuilder
*/

struct ExpressionBuilder {
	
	var expression: Expression?
	var pendingNumber: Double?
	var pendingOperator: BinaryOperator?
	
	mutating func reset() {
		pendingNumber = expression?.evaluate()
		expression = nil
		pendingOperator = nil
	}
	
	mutating func updateExpression() {
		switch (self.expression, pendingOperator, pendingNumber) {
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
	
	mutating func append(_ number: Double) {
		self.pendingNumber = number
		self.updateExpression()
	}
	
	mutating func append(_ op: BinaryOperator) {
		pendingOperator = op
		updateExpression()
	}
}
//: [Next](@next)
