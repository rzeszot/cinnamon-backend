import Foundation

public struct Attribute {
  public let id: Identifier
  public let code: Code

  public typealias Identifier = String

  public typealias Code = String
}

extension Attribute: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}

extension Attribute: Equatable {
  public static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.id == rhs.id
  }
}

extension Attribute: ExpressibleByStringLiteral {
  public init(code: Code) {
    id = "attribute:" + code
    self.code = code
  }

  public init(stringLiteral value: String) {
    self.init(code: normalize(value))
  }
}

private func normalize(_ string: String) -> String {
  string
    .lowercased()
    .replacingOccurrences(of: " ", with: "-")
}
