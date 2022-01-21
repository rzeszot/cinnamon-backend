import Foundation

public struct ListAllMoviesService {
  public let repository: MovieRepository

  public init(repository: MovieRepository) {
    self.repository = repository
  }

  // MARK: -

  public func list() -> Response {
    let movies = repository.all()
    return Response(movies: movies)
  }

  // MARK: -

  public struct Item: Encodable {
    public let id: String
    public let title: String
    public let duration: UInt

    init(movie: Movie) {
      id = movie.id
      title = movie.title + " (" + movie.year + ")"
      duration = movie.duration
    }
  }

  public struct Response: Encodable {
    public let movies: [Item]

    init(movies: [Movie]) {
      self.movies = movies.map(Item.init(movie:))
    }
  }

}
