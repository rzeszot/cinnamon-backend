import Foundation

public struct MovieImportService {
  public let repository: MovieRepository

  public init(repository: MovieRepository) {
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
    let movie = Movie(item: item)
    repository.save(movie: movie)
  }

  // MARK: -

  fileprivate struct Item: Codable {
    let id: String
    let title: String
    let duration: UInt
    let year: UInt
  }
}

private extension Movie {
  init(item: MovieImportService.Item) {
    id = item.id
    title = item.title
    duration = item.duration
    year = String(item.year)
  }
}

