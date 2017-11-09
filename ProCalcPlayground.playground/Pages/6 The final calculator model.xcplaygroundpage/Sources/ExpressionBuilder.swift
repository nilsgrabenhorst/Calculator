import Foundation


public struct ExpressionBuilder {
	public init() {}
	
	public private (set) var expression: Expression?
	public var pendingNumber: Double?
	public var pendingOperator: BinaryOperator?
	
	public mutating func append(_ number: Double) {
		self.pendingNumber = number
		self.updateExpression()
	}
	
	public mutating func append(_ op: BinaryOperator) {
		pendingOperator = op
		updateExpression()
	}
	
	public mutating func reset() {
		pendingNumber = expression?.evaluate()
		expression = nil
		pendingOperator = nil
	}
	
	public mutating func updateExpression() {
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
}
