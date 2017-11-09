import Foundation

public indirect enum Expression {
	case
	binary(Expression, BinaryOperator, Expression),
	value(Double)
}
