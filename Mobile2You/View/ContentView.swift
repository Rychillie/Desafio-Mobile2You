//
//  ContentView.swift
//  Mobile2You
//
//  Created by Rychillie Umpierre de Oliveira on 16/10/21.
//

import SwiftUI

struct ContentView: View {
    @State var imageName: String = "heart"
    @State var movie: Movie? = nil
    @State var movieSimiliar: MoviesSimiliar? = nil
    let firstIdMovie = 333339
    
    var body: some View {
        
        ZStack{
            Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            GeometryReader { g in
                
                ScrollView (showsIndicators: false) {
                    MovieInfo(movie: self.movie)
                        List{
                            ForEach(movieSimiliar?.results ?? [], id: \.id){ result in
                                MovieCard(movieId: result.id)
                            }
                        }.frame(width: g.size.width , height: g.size.height)
                    
                   
                    
                }.ignoresSafeArea(.all, edges: .all).frame(width: g.size.width)

                
            }.background(LinearGradient(gradient: Gradient(colors: [.black.opacity(0.80), .black]), startPoint: .center, endPoint: .bottom))
            
        }.onAppear{
            Api().getFirstMovie(id: self.firstIdMovie) { (movie) in
                self.movie = movie
            }
            ApiGetSimiliar().getSimiliarMoviesById(id: self.firstIdMovie) { (movie) in
                self.movieSimiliar = movie
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
