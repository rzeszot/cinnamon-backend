@testable import Movies

extension InMemoryRoomsRepository {
  static var example: InMemoryRoomsRepository = {
    let repository = InMemoryRoomsRepository()

    repository.save(room: Room(
      id: "cinema.1:room.1",
      name: "Room 1"
    ), in: "cinema:1")
    repository.save(room: Room(
      id: "cinema.1:room.2",
      name: "Room 2"
    ), in: "cinema:1")

    repository.save(room: Room(
      id: "cinema.2:room.a",
      name: "Room A"
    ), in: "cinema:2")
    repository.save(room: Room(
      id: "cinema.2:room.b",
      name: "Room B"
    ), in: "cinema:2")

    return repository
  }()
}
