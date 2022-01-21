import Foundation

public class InMemoryMovieRepository: MovieRepository {
  private var data: [Movie.Identifier: Movie] = [:]

  public init() {

  }

  public func all() -> [Movie] {
    Array(data.values).sorted { $0.id < $1.id }
  }

  public func save(movie: Movie) {
    data[movie.id] = movie
  }

}
