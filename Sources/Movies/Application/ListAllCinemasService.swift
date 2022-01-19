import Foundation

public struct ListAllCinemasService {
  public let repository: CinemaRepository

  public init(repository: CinemaRepository) {
    self.repository = repository
  }

  public func list() -> Response {
    let cinemas = repository.all()
    return Response(cinemas: cinemas)
  }

  // MARK: -

  public struct Item: Encodable {
    public let id: String
    public let name: String

    init(cinema: Cinema) {
      id = cinema.id
      name = cinema.name
    }
  }

  public struct Response: Encodable {
    public let items: [Item]

    init(cinemas: [Cinema]) {
      items = cinemas.map(Item.init(cinema:))
    }
  }
}
