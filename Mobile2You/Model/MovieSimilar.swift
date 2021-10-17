//
//  MovieSimilar.swift
//  Mobile2You
//
//  Created by Rychillie Umpierre de Oliveira on 17/10/21.
//

import SwiftUI

struct MoviesSimiliar: Decodable{
    var page: Int
    var results: [MovieResults]
}

struct MovieResults: Decodable, Identifiable {
    var id: String?
    var title: String?
    var genre: [Int]?
    var posterPath: String?
    var releaseDate: String?
    
    enum CodingKeys: String, CodingKey{
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case genre = "genre_ids"
        case title
    }
}

struct Genres: Decodable{
    var id: Int
    var name: String
}

class ApiGetSimiliar{
    private var apiKey: String = ProcessInfo.processInfo.environment["API_KEY"] ?? "";
    
    func getSimiliarMoviesById(id: Int, completion: @escaping (MoviesSimiliar) -> ()){
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)/similar?api_key=\(apiKey)")else{return}
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let moviesId = try! JSONDecoder().decode(MoviesSimiliar.self, from: data!)
            
            DispatchQueue.main.async {
                completion(moviesId)
            }
        }.resume()
    }
    
    func getGeners(completion: @escaping (Genres) ->()) {
        guard let url = URL(string: "https://api.themoviedb.org/3/genre/movie/list?api_key=\(apiKey)")else{return}
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let geners = try! JSONDecoder().decode(Genres.self, from: data!)
            
            DispatchQueue.main.async {
                completion(geners)
            }
        }.resume()
    }
}
