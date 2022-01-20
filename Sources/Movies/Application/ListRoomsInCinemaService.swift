import Foundation

public struct ListRoomsInCinemaService {
  public let repository: RoomsRepository

  public init(repository: RoomsRepository) {
    self.repository = repository
  }

  // MARK: -

  public func list(in cinema: Cinema.Identifier) -> Response {
    let rooms = repository.find(in: cinema)
    return Response(cinema: cinema, rooms: rooms)
  }

  // MARK: -

  public struct Item: Encodable {
    public let id: String
    public let name: String

    init(room: Room) {
      id = room.id
      name = room.name
    }
  }

  public struct Response: Encodable {
    public let cinema: String
    public let rooms: [Item]

    enum CodingKeys: String, CodingKey {
      case cinema = "cinema_id"
      case rooms
    }

    init(cinema: Cinema.Identifier, rooms: [Room]) {
      self.cinema = cinema
      self.rooms = rooms.map(Item.init(room:))
    }
  }

}
