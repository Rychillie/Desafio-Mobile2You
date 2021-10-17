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

struct MoviesSimiliar: Decodable{
    var page: Int
    var results: [MovieResults]
}

struct MovieResults: Decodable, Identifiable, Hashable {
    var idResult: UUID = UUID()
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

struct Genrens: Decodable{
    var genres: [Geners]
}

struct Geners: Decodable, Identifiable, Hashable {
    var id: Int
    var name: String
}
