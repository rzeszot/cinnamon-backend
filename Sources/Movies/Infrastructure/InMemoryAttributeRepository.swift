import Foundation

public class InMemoryAttributeRepository: AttributeRepository {

  private var data: Set<Attribute> = []

  public init() {

  }

  // MARK: -

  public func all() -> [Attribute] {
    Array(data).sorted { $0.id < $1.id }
  }

  public func save(attribute: Attribute) {
    data.update(with: attribute)
  }

}
