/*: [Previous](@previous)
# Operator Definition

We want to model four operations: Addition, subtraction, multiplication, and division.
`enum`s are great types for modeling mutually exclusive variations of a thing.

Swift `enum`s are powerful:
* They can have raw values of any kind. We will use a `String` raw value to associate the operator symbol with an operator.
* They can have methods and computed properties. We use this to add evaluation and precedence functionality.
* They can have extensions. We'll use an extension to add evaluation and precedence.
Here is the basic `BinaryOperator` enum with its raw values:
*/
enum BinaryOperator: String {
	case
	addition = "+",
	subtraction = "-",
	multiplication = "×",
	division = "÷"
}
//: Let's add evaluation and precedence functionality:

extension BinaryOperator {
	
	var evaluate: (Double, Double) -> Double { return definitions.f }
	var precedence: Int { return definitions.precedence }
	
	private var definitions: (f: (Double, Double) -> Double, precedence: Int) {
		switch self {
		case .addition: return (+, 10)
		case .subtraction: return (-, 10)
		case .multiplication: return (*, 20)
		case .division: return (/, 20)
		}
	}
}
//: Time to give it a go:
let op: BinaryOperator = .multiplication
op.evaluate(2, 3)
//: [Next](@next)
