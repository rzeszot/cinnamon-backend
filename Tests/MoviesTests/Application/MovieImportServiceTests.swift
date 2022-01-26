import XCTest
import SnapshotTesting
import Movies

final class MovieImportServiceTests: XCTestCase {

  var repository: InMemoryMovieRepository!
  var sut: MovieImportService!

  override func setUp() {
    repository = InMemoryMovieRepository()
    sut = MovieImportService(repository: repository)
  }

  override func tearDown() {
    sut = nil
    repository = nil
  }

  // MARK: -

  func test_loadFromData_dataIsValid_savesAllMoviesInTheRepository() throws {
    try sut.load(from: Fixture.movies)

    XCAssertSnapshot(matching: repository.all(), as: .dump)
  }

}

private enum Fixture {
  static var movies: Data = """
    [
      {
        "id": "movie:1",
        "title": "Spider-Man. Bez drogi do domu",
        "year": 2021,
        "duration": 147
      },
      {
        "id": "movie:2",
        "title": "Matrix Zmartwychwstania",
        "year": 2021,
        "duration": 148
      }
    ]
    """.data(using: .utf8)!
}
