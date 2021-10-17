//
//  MovieViewModel.swift
//  Mobile2You
//
//  Created by Rychillie Umpierre de Oliveira on 17/10/21.
//

import Foundation

final class MovieViewModel: ObservableObject {
    @Published var movieSimilarList: [MovieResults] = []
    @Published var movieGeneres: [String] = []
    @Published var genereList: [Geners] = []
    @Published var movie: Movie?
    @Published var movieSimiliar: MoviesSimiliar?
    @Published var isFavorite: Bool = false
    
    var imageName: String { isFavorite ? "heart.fill" : "heart"}
    
    private var movieRepository: MovieAPI
    let firstIdMovie = 333339
    
    init (_ movieRepository: MovieAPI = MovieAPI()) {
        self.movieRepository = movieRepository
    }
    
    // MARK: Methods
    func fetchMovieSimilarList() {
        movieRepository.getSimiliarMoviesById(id: firstIdMovie) { item in
            item.results.forEach { movies in
                self.movieSimilarList.append(
                    MovieResults(
                        id: movies.id,
                        title: movies.title,
                        genre: movies.genre,
                        posterPath: movies.posterPath,
                        releaseDate: movies.releaseDate
                    )
                )
            }
        }
    }
    
    func fetchGeneres() {
        movieRepository.getGeners { list in
            list.genres.forEach { geners in
                self.genereList.append(Geners(id: geners.id, name: geners.name))
            }
        }
    }
}

extension Double {
    func formatToK() -> String {
        let num = self > 1000 ? Double(self)/1000.0 : Double(self)
        return String(format: self >= 1000 ? "%.1fK" : "%.0f",num)
    }
}
