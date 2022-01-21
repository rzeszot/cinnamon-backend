@testable import Movies

extension InMemoryCinemaRepository {
  static var example: InMemoryCinemaRepository = {
    let repository = InMemoryCinemaRepository()

    repository.save(cinema: Cinema(
      id: "cinema:1",
      name: "Kino #1",
      address: ["Tomasza Zana 11A", "20-601 Lublin"],
      location: Cinema.Location(latitude: 51.24295906419916, longitude: 22.514032451069653)
    ))
    repository.save(cinema: Cinema(
      id: "cinema:2",
      name: "Kino #2",
      address: ["Inflacji Morawieckiego 1", "20-531 Lublin"],
      location: Cinema.Location(latitude: 51.22717193740886, longitude: 22.525791090775193)
    ))
    repository.save(cinema: Cinema(
      id: "cinema:3",
      name: "Kino #3",
      address: ["Łąkie 60B", "77-420 Łąkie"],
      location: Cinema.Location(latitude: 53.50155399203942, longitude: 17.11997059759857)
    ))

    return repository
  }()
}
