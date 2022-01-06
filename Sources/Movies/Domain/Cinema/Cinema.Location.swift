import Foundation

extension Cinema {
  public struct Location: Codable {
    public let latitude: Float
    public let longitude: Float

    public init(latitude: Float, longitude: Float) {
      self.latitude = latitude
      self.longitude = longitude
    }
  }
}
