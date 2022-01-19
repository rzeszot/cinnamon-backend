import Foundation

public struct Cinema {
  public let id: String
  public let name: String
  public let address: Address
  public let location: Location

  public typealias Address = [String]

  public struct Location {
    public let latitude: Float
    public let longitude: Float
  }
}
