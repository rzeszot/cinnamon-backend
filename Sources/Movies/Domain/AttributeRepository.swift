import Foundation

public protocol AttributeRepository {
  func all() -> [Attribute]

  func save(attribute: Attribute)
}
