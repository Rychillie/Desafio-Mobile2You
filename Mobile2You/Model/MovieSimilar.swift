//
//  MovieSimilar.swift
//  Mobile2You
//
//  Created by Rychillie Umpierre de Oliveira on 17/10/21.
//

import SwiftUI

struct MoviesSimiliar: Decodable{
    struct Results: Decodable {
        var id: Int
    }
    
    var page: Int
    var results: [Results]
}

class ApiGetSimiliar{
    func getSimiliarMoviesById(id: Int, completion: @escaping (MoviesSimiliar) -> ()){
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)/similar?api_key=6fd84a57c4346398aaae25e1f931818b")else{return}
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let moviesId = try! JSONDecoder().decode(MoviesSimiliar.self, from: data!)
            
            DispatchQueue.main.async {
                completion(moviesId)
            }
        }.resume()
    }
}
