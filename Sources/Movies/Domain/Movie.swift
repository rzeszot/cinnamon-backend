import Foundation

public struct Movie {
  public let id: Identifier
  public let title: String
  public let year: String
  public let duration: UInt
  public let attributes: [Attribute]

  public typealias Identifier = String
}
