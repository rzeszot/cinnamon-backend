import Foundation

public protocol CinemaRepository {
  func all() -> [Cinema]
  func save(cinema: Cinema)
}
