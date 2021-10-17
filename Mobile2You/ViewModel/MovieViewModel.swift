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
    
    private var movieRepository: ApiGetSimiliar
    let firstIdMovie = 333339
    
    init (_ movieRepository: ApiGetSimiliar = ApiGetSimiliar()) {
        self.movieRepository = movieRepository
    }
    
    // MARK: Methods
    func fetchMovieSimilarList() {
        movieRepository.getSimiliarMoviesById(id: firstIdMovie) { item in
            item.results.forEach { item in
                self.movieSimilarList.append(MovieResults(
                    title: item.title,
                    genre: item.genre,
                    posterPath: item.posterPath,
                    releaseDate: item.releaseDate
                ))
            }
        }
    }
}

