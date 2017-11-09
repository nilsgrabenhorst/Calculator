import Foundation

public enum BinaryOperator: String {
	case
	addition = "+",
	subtraction = "-",
	multiplication = "×",
	division = "÷"
	
	public var evaluate: (Double, Double) -> Double { return definitions.f }
	public var precedence: Int { return definitions.precedence }
	
	private var definitions: (f: (Double, Double) -> Double, precedence: Int) {
		switch self {
		case .addition: return (+, 10)
		case .subtraction: return (-, 10)
		case .multiplication: return (*, 20)
		case .division: return (/, 20)
		}
	}
}
