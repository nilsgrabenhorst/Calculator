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
}
