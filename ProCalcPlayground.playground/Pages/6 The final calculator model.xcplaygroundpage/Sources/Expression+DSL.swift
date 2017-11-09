import Foundation

extension Expression : ExpressibleByFloatLiteral {
	public init(floatLiteral value: Double) {
		self = .value(value)
	}
}

extension Expression: ExpressibleByIntegerLiteral {
	public init(integerLiteral value: Int) {
		self = .value(Double(value))
	}
}


public func +(lhs: Expression, rhs: Expression) -> Expression {
	return .binary(lhs, .addition, rhs)
}

public func -(lhs: Expression, rhs: Expression) -> Expression {
	return .binary(lhs, .subtraction, rhs)
}

public func *(lhs: Expression, rhs: Expression) -> Expression {
	return .binary(lhs, .multiplication, rhs)
}

public func /(lhs: Expression, rhs: Expression) -> Expression {
	return .binary(lhs, .division, rhs)
}
