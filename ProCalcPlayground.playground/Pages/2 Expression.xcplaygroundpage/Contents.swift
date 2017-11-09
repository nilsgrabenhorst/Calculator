/*:
[Previous](@previous)
# Expressions

We can model an expression as a tree where the nodes are `BinaryOperations` and the leaves are `Double` values. Such a data structure handles operator precedence quite elegantly.

What type to use for something that can be one of two things (either a node or a leaf)? An `enum`, of course! Another neat feature of Swift enums are associated values: Instead of a raw value, each case can have its own separate value attached.
*/
indirect enum Expression {
	case
	binary(Expression, BinaryOperator, Expression),
	value(Double)
}
/*:
Note that this enum needs to be marked as `indirect` because the associated value for `.binary` contains references to `Expression`s.

We can now build an expression tree like this:
*/
let exp: Expression = .binary(.value(2), .addition, .value(3))
print(exp)
/*:
Not as succinct as I would like this to be. But that will be fixed on the [Next](@next) page :)
*/
