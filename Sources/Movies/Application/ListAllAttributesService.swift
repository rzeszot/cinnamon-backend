import Foundation

public struct ListAllAttributesService {
  public let repository: AttributeRepository

  public init(repository: AttributeRepository) {
    self.repository = repository
  }

  public func list() -> Response {
    let attributes = repository.all()
    return Response(attributes: attributes)
  }

  // MARK: -

  public struct Item: Encodable {
    public let code: String

    init(attribute: Attribute) {
      code = attribute.code
    }
  }

  public struct Response: Encodable {
    public let items: [Item]

    init(attributes: [Attribute]) {
      items = attributes.map(Item.init(attribute:))
    }
  }
}
