//
//  Movie.swift
//  Mobile2You
//
//  Created by Rychillie Umpierre de Oliveira on 17/10/21.
//

import SwiftUI

struct Movie: Decodable{
    var backdrop_path: String? // image
    var poster_path: String? // image
    var vote_count: Int? // likes
    var original_title: String?
    var popularity: Double?
}

class Api{
    private var apiKey: String = ProcessInfo.processInfo.environment["API_KEY"] ?? "";
    
    func getFirstMovie(id: Int, completion: @escaping (Movie) -> ()){
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=\(apiKey)")else{return}
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let movies = try! JSONDecoder().decode(Movie.self, from: data!)
            
            DispatchQueue.main.async {
                completion(movies)
            }
            
        }.resume()
    }
}
