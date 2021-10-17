//
//  MovieAPI.swift
//  Mobile2You
//
//  Created by Rychillie Umpierre de Oliveira on 17/10/21.
//

import SwiftUI

class MovieAPI{
    private var apiKey: String = ProcessInfo.processInfo.environment["API_KEY"] ?? "";
    private var url: String = "https://api.themoviedb.org/3"
    
    func getFirstMovie(id: Int, completion: @escaping (Movie) -> ()){
        guard let url = URL(string: "\(url)/movie/\(id)?api_key=\(apiKey)")else{return}
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let movies = try! JSONDecoder().decode(Movie.self, from: data!)
            
            DispatchQueue.main.async {
                completion(movies)
            }
            
        }.resume()
    }
    
    func getSimiliarMoviesById(id: Int, completion: @escaping (MoviesSimiliar) -> ()){
        guard let url = URL(string: "\(url)/movie/\(id)/similar?api_key=\(apiKey)")else{return}
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let dataRequest = try! JSONDecoder().decode(MoviesSimiliar.self, from: data!)
            print(dataRequest.results)
            DispatchQueue.main.async {
                completion(dataRequest)
            }
        }.resume()
    }
    
    func getGeners(completion: @escaping (Genres) ->()) {
        guard let url = URL(string: "\(url)/genre/movie/list?api_key=\(apiKey)")else{return}
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let geners = try! JSONDecoder().decode(Genres.self, from: data!)
            
            DispatchQueue.main.async {
                completion(geners)
            }
        }.resume()
    }
}
