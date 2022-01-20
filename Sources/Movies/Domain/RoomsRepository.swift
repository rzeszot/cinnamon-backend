import Foundation

public protocol RoomsRepository {
  func save(room: Room, in cinema: Cinema.Identifier)
  func find(in cinema: Cinema.Identifier) -> [Room]
}
