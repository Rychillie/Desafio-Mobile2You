//
//  MovieCard.swift
//  Mobile2You
//
//  Created by Rychillie Umpierre de Oliveira on 17/10/21.
//

import SwiftUI

struct MovieCard: View{
    var movieId: Int
    @State var movie: Movie? = nil
    @State var genres: String = ""
    
    var body: some View {
        HStack{
            Image(uiImage: "https://image.tmdb.org/t/p/original/\(movie?.poster_path ?? "")".load()).resizable().frame(width: 60, height: 80)
            Spacer()
                .frame(width: 15)
            
            VStack(alignment: .leading, spacing: 2){
                Text(String(self.movie?.original_title ?? ""))
                HStack{
                    Text(self.movie?.release_date[(self.movie?.release_date.startIndex)!..<(self.movie?.release_date.index((self.movie?.release_date.startIndex)!, offsetBy: 4))!] ?? "").font(.footnote)
                    
                    Text(self.genres).font(.footnote).foregroundColor(.gray)
                    
                }
            }.foregroundColor(.white)
            
        }.listRowBackground(Color.black)
        .onAppear{
            Api().getFirstMovie(id: self.movieId) { (movie) in
                self.movie = movie
                self.genres = String(movie.genres[0].name) + (movie.genres.count > 1 ? ", " + String(movie.genres[1].name) : "")
            }
        }
    }
}





