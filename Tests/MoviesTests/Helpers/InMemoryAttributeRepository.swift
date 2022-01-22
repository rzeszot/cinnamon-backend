@testable import Movies

extension InMemoryAttributeRepository {
  static var example: InMemoryAttributeRepository = {
    let repository = InMemoryAttributeRepository()

    repository.save(attribute: Attribute(
      id: "attribute:1",
      code: "2d"
    ))
    repository.save(attribute: Attribute(
      id: "attribute:2",
      code: "3d"
    ))
    repository.save(attribute: Attribute(
      id: "attribute:3",
      code: "4dx"
    ))

    return repository
  }()
}
