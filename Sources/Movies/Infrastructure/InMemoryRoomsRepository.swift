import Foundation

public class InMemoryRoomsRepository: RoomsRepository {
  private var data: [Cinema.Identifier: Set<Room>] = [:]

  public init() {

  }

  public func save(room: Room, in cinema: Cinema.Identifier) {
    data[cinema, default: []].update(with: room)
  }

  public func find(in cinema: Cinema.Identifier) -> [Room] {
    Array(data[cinema] ?? []).sorted { $0.id < $1.id }
  }
}
