import Foundation

extension BinaryOperator: CustomStringConvertible {
	public var description: String {
		return rawValue
	}
}

extension Expression: CustomStringConvertible, CustomDebugStringConvertible {
	public var debugDescription: String {
		switch self {
		case let .binary(lhs, op, rhs):
			return "(\(lhs.debugDescription) \(op) \(rhs.debugDescription))"
			
		case let .value(value):
			return String(value)
		}
	}
	
	public var description: String {
		return self.diagram("", "", "")
	}
	
	private func diagram(_ top: String, _ root: String, _ bottom: String) -> String {
		switch self {
		case let .binary(lhs, op, rhs):
			return rhs.diagram(top + "     ", top + "╭─── ", top + "│    ")
				+ root + "\(op)\n"
				+ lhs.diagram(bottom + "│    ", bottom + "╰─── ", bottom + "     ")
			
		case let .value(value):
			return root + "\(value)\n"
		}
	}
}
