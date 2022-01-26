import XCTest
import SnapshotTesting
import Movies

final class ListAllCinemasServiceTests: XCTestCase {

  var repository: InMemoryCinemaRepository!
  var sut: ListAllCinemasService!

  override func setUp() {
    repository = InMemoryCinemaRepository.example
    sut = ListAllCinemasService(repository: repository)
  }

  override func tearDown() {
    sut = nil
    repository = nil
  }

  // MARK: -

  func test_listAllCinemas() throws {
    let result = sut.list()

    XCAssertSnapshot(matching: result, as: .json)
  }

}
