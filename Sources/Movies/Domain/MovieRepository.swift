import Foundation

public protocol MovieRepository {
  func all() -> [Movie]
  func save(movie: Movie)
}
