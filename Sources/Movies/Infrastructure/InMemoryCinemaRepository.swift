import Foundation

public class InMemoryCinemaRepository: CinemaRepository {
  private var data: [Cinema.Identifier: Cinema] = [:]

  public init() {

  }

  public func all() -> [Cinema] {
    Array(data.values).sorted { $0.id < $1.id }
  }

  public func save(cinema: Cinema) {
    data[cinema.id] = cinema
  }

}
