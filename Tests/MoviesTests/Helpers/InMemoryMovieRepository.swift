@testable import Movies

extension InMemoryMovieRepository {
  static var example: InMemoryMovieRepository = {
    let repository = InMemoryMovieRepository()

    repository.save(movie: Movie(
      id: "movie:1",
      title: "Spider-Man. Bez drogi do domu",
      year: "2021",
      duration: 147,
      attributes: [
        "2d",
        "4dx",
        "action",
        "sci-fi",
        "original-lang-en-us",
        "dubbed",
        "dubbed-lang-pl",
        "subbed",
        "subbed-lang-pl"
      ]
    ))
    repository.save(movie: Movie(
      id: "movie:2",
      title: "Matrix Zmartwychwstania",
      year: "2021",
      duration: 148,
      attributes: [
        "2d",
        "action",
        "sci-fi",
        "original-lang-en-us",
        "dubbed",
        "dubbed-lang-pl",
        "subbed",
        "subbed-lang-pl"
      ]
    ))

    return repository
  }()
}
