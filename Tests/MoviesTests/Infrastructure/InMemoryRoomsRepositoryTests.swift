import XCTest
import SnapshotTesting
@testable import Movies

final class InMemoryRoomsRepositoryTests: XCTestCase {

  var sut: InMemoryRoomsRepository!

  override func setUp() {
    sut = InMemoryRoomsRepository()
  }

  override func tearDown() {
    sut = nil
  }

  // MARK: -

  func test_saveRoomInCinema_withNoRooms_createsNewRoomInTheCinema() throws {
    let room = Room(id: "cinema:1:room:1", name: "Room 1")

    sut.save(room: room, in: "cinema:1")

    assertSnapshot(matching: sut.find(in: "cinema:1"), as: .dump)
    assertSnapshot(matching: sut.find(in: "cinema:0"), as: .dump)
  }

  func test_saveRoomInCinema_withARoom_overridesRoomInTheCinema() throws {
    sut.save(room: Room(id: "cinema:1:room:1", name: "Room 1"), in: "cinema:1")

    let room = Room(id: "cinema:1:room:1", name: "Room A")
    sut.save(room: room, in: "cinema:1")

    assertSnapshot(matching: sut.find(in: "cinema:1"), as: .dump)
    assertSnapshot(matching: sut.find(in: "cinema:0"), as: .dump)
  }

}
