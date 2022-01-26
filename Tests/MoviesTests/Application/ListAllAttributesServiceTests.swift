import XCTest
import SnapshotTesting
import Movies

final class ListAllAttributesServiceTests: XCTestCase {

  var repository: InMemoryAttributeRepository!
  var sut: ListAllAttributesService!

  override func setUp() {
    repository = InMemoryAttributeRepository.example
    sut = ListAllAttributesService(repository: repository)
  }

  override func tearDown() {
    sut = nil
    repository = nil
  }

  // MARK: -

  func test_listAllAttributes() throws {
    let result = sut.list()

    XCAssertSnapshot(matching: result, as: .json)
  }

}
