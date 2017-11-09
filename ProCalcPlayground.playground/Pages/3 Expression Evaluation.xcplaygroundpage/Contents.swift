/*:
[Previous](@previous)
# Expression Evaluation

I added a few simple functions in the Expression+DSL.swift file in the sources folder of this page. Now you can write expression trees like a boss:
*/
let exp: Expression = 2 + 3 * 5 - 4 / 2
print(exp)
/*:
There's also an extension for pretty printing the expression tree. Check the output on the console.
Since it would be nice to be able to evaluate the expression tree we add an extension with an evaluation method:
*/
extension Expression {
	
	func evaluate() -> Double {
		switch self {
		case .value(let v):
			return v
			
		case let .binary(lhs, op, rhs):
			return op.evaluate(lhs.evaluate(), rhs.evaluate())
		}
	}
	
}

let result = exp.evaluate()
print("                        Result: \(result)")
//: [Next](@next)
