//
//  MovieViewModel.swift
//  Mobile2You
//
//  Created by Rychillie Umpierre de Oliveira on 16/10/21.
//

import SwiftUI

class MovieViewModel: ObservableObject {
//    var apiURL : String = "https://api.themoviedb.org/3";
//    var apiKey: String = ProcessInfo.processInfo.environment["API_KEY"] ?? "";
    
    func fetchData() {
        let url = URL(string: "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=6fbec5853a8e2caa4a9bbaa6fb7127e0")
        
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
