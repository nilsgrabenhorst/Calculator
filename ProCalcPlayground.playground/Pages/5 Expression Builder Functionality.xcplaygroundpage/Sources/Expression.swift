import Foundation

public indirect enum Expression {
	case
	binary(Expression, BinaryOperator, Expression),
	value(Double)
	
	public func evaluate() -> Double {
		switch self {
		case .value(let v):
			return v
		case let .binary(lhs, op, rhs):
			return op.evaluate(lhs.evaluate(), rhs.evaluate())
		}
	}
	
	public var precedence: Int {
		switch self {
		case .value:
			return Int.max
		case .binary(_, let op, _):
			return op.precedence
		}
	}
}
