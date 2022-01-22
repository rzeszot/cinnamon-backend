import Foundation

public class InMemoryAttributeRepository: AttributeRepository {

  private var _all: Set<Attribute> = []

  public init() {

  }

  // MARK: -

  public func all() -> [Attribute] {
    Array(_all).sorted { $0.id < $1.id }
  }

  public func save(attribute: Attribute) {
    _all.update(with: attribute)
  }

}
