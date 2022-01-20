import Foundation

public struct Room {
  public let id: Identifier
  public let name: String

  public typealias Identifier = String
}

extension Room: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}

extension Room: Equatable {
  public static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.id == rhs.id
  }
}
