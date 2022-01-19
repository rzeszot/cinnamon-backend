import Foundation

public struct CinemaImportService {
  public let repository: CinemaRepository

  public init(repository: CinemaRepository) {
    self.repository = repository
  }

  // MARK: -

  public func load(from data: Data) throws {
    let decoder = JSONDecoder()
    let items = try decoder.decode([Item].self, from: data)

    store(items: items)
  }

  // MARK: -

  private func store(items: [Item]) {
    for item in items {
      store(item: item)
    }
  }

  private func store(item: Item) {
    let cinema = Cinema(item: item)
    repository.save(cinema: cinema)
  }

  // MARK: -

  fileprivate struct Item: Codable {
    let id: String
    let name: String
    let address: Address
    let location: Location
  }

  fileprivate typealias Address = [String]

  fileprivate struct Location: Codable {
    let latitude: Float
    let longitude: Float
  }
}

private extension Cinema {
  init(item: CinemaImportService.Item) {
    id = item.id
    name = item.name
    address = item.address
    location = Location(location: item.location)
  }
}

private extension Cinema.Location {
  init(location: CinemaImportService.Location) {
    latitude = location.latitude
    longitude = location.longitude
  }
}
