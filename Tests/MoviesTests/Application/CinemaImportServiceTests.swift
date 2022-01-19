import XCTest
import SnapshotTesting
import Movies

final class CinemaImportServiceTests: XCTestCase {

  var repository: InMemoryCinemaRepository!
  var sut: CinemaImportService!

  override func setUp() {
    repository = InMemoryCinemaRepository()
    sut = CinemaImportService(repository: repository)
  }

  override func tearDown() {
    sut = nil
    repository = nil
  }

  // MARK: -

  func test_loadFromURL_dataIsValid_savesAllCinemasInTheRepository() throws {
    try sut.load(from: Fixture.cinemas)

    assertSnapshot(matching: repository.all(), as: .dump)
  }

}

private enum Fixture {
  static var cinemas: Data = """
    [
      {
        "id": "cinema:1",
        "name": "Kino #1",
        "address": [
          "Tomasza Zana 11A",
          "Lublin",
          "20-601"
        ],
        "location": {
          "latitude": 51.24295906419916,
          "longitude": 22.514032451069653
        }
      },
      {
        "id": "cinema:2",
        "name": "Kino #2",
        "address": [
          "Inflacji Morawieckiego 1",
          "Lublin",
          "20-531"
        ],
        "location": {
          "latitude": 51.22717193740886,
          "longitude": 22.525791090775193
        }
      }
    ]
    """.data(using: .utf8)!
}
