@testable import Movies

extension InMemoryMovieRepository {
  static var example: InMemoryMovieRepository = {
    let repository = InMemoryMovieRepository()

    repository.save(movie: Movie(
      id: "movie:1",
      title: "Spider-Man. Bez drogi do domu",
      year: "2021",
      duration: 147
    ))
    repository.save(movie: Movie(
      id: "movie:2",
      title: "Matrix Zmartwychwstania",
      year: "2021",
      duration: 148
    ))

    return repository
  }()
}
