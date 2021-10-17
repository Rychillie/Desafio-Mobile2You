//
//  MovieViewModel.swift
//  Mobile2You
//
//  Created by Rychillie Umpierre de Oliveira on 16/10/21.
//

import SwiftUI

class MovieViewModel: ObservableObject {
    var apiURL : String = "https://api.themoviedb.org/3";
    var apiKey: String = ProcessInfo.processInfo.environment["API_KEY"] ?? "";
    let movieId: String = "333339"; // Ready Player One
    
    func fetchData() {
        let url = URL(string: "\(apiURL)/discover/movie?sort_by=popularity.desc&api_key=\(apiKey)")
//        let callMovie = URL(string: "\(apiURL)/movie/\(movieId)?api_key=\(apiKey)")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    print(json)
                } catch (let error) {
                    print(error)
                    return
                }
            } else {
                print("error")
                return
            }
        }.resume()
    }
}

