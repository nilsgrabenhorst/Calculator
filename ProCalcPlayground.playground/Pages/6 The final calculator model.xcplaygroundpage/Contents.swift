/*:
[Previous](@previous)

Great, we can finally build expressions the hard way. But this is the API that we can use in our `ViewController`.
*/

var builder = ExpressionBuilder()

builder.append(2)
builder.append(.addition)
builder.append(3)
builder.append(.multiplication)
builder.append(5)

print(builder.expression!)
builder.expression?.evaluate()
