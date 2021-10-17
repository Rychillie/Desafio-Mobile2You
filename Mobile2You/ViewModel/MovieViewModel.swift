//
//  MovieViewModel.swift
//  Mobile2You
//
//  Created by Rychillie Umpierre de Oliveira on 17/10/21.
//

import Foundation

final class MovieViewModel: ObservableObject {
    @Published var imageName: String = "heart"
    @Published var movieSimilarList: [MovieResults] = []
    @Published var movie: Movie?
    @Published var movieSimiliar: MoviesSimiliar?
    
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
                        releaseDate: movies.releaseDate)
                )
            }
        }
        print(movieSimilarList)
    }
}
