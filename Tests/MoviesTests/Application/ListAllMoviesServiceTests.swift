import XCTest
import SnapshotTesting
import Movies

final class ListAllMoviesServiceTests: XCTestCase {

  var repository: InMemoryMovieRepository!
  var sut: ListAllMoviesService!

  override func setUp() {
    repository = InMemoryMovieRepository.example
    sut = ListAllMoviesService(repository: repository)
  }

  override func tearDown() {
    sut = nil
    repository = nil
  }

  // MARK: -

  func test_listAllMovies() throws {
    let result = sut.list()

    XCAssertSnapshot(matching: result, as: .json)
  }

}
