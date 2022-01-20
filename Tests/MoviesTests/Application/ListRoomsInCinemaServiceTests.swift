import XCTest
import SnapshotTesting
import Movies

final class ListRoomsInCinemaServiceTests: XCTestCase {

  var repository: InMemoryRoomsRepository!
  var sut: ListRoomsInCinemaService!

  override func setUp() {
    repository = InMemoryRoomsRepository.example
    sut = ListRoomsInCinemaService(repository: repository)
  }

  override func tearDown() {
    sut = nil
    repository = nil
  }

  // MARK: -

  func test_listInCinema_1() throws {
    let result = sut.list(in: "cinema:1")

    assertSnapshot(matching: result, as: .json)
  }

  func test_listInCinema_2() throws {
    let result = sut.list(in: "cinema:2")

    assertSnapshot(matching: result, as: .json)
  }

}
