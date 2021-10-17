//
//  MovieView.swift
//  Mobile2You
//
//  Created by Rychillie Umpierre de Oliveira on 16/10/21.
//

import SwiftUI

struct MovieView: View {
    @ObservedObject var viewModel: MovieViewModel
    
    var body: some View {
        
        ZStack{
            Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            GeometryReader { g in
                
                ScrollView (showsIndicators: false) {
                    MovieInfo().environmentObject(viewModel)
                        VStack{
                            ForEach(viewModel.movieSimilarList){ card in
                                MovieCard(name: card.title ?? "Title",
                                          posterPath: card.posterPath ?? "",
                                          genres: card.genre ?? [0],
                                          releaseDate: card.releaseDate ?? ""
                                )
                            }
                        }.frame(width: g.size.width , height: g.size.height)
                    
                   
                    
                }.ignoresSafeArea(.all, edges: .all).frame(width: g.size.width)

                
            }.background(LinearGradient(gradient: Gradient(colors: [.black.opacity(0.80), .black]), startPoint: .center, endPoint: .bottom))
            
        }.onAppear{
            Api().getFirstMovie(id: viewModel.firstIdMovie) { (movie) in
                viewModel.movie = movie
            }
            ApiGetSimiliar().getSimiliarMoviesById(id: viewModel.firstIdMovie) { (movie) in
                viewModel.movieSimiliar = movie
            }
        }
    }
}

// MARK: Info
struct MovieInfo: View{
    @EnvironmentObject var viewModel: MovieViewModel

    var body: some View {
      
            VStack(alignment: .leading, spacing: 10){
                
                ZStack{
                    
                    Image(uiImage: "https://image.tmdb.org/t/p/original/\(viewModel.movie?.poster_path ?? "")".load())
                        .resizable()
                        .scaledToFit()

                    Button(action: {
                        
                        print("Edit button back was tapped")
                    }) {
                        Image(systemName: "chevron.left.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                            
                    } .offset(x: -170, y:-220)
                }
                
                HStack{
                    Text("The best based of Ready Player One").font(.system(size: 30)).bold().frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 22)
                    
                    Button(action: {
                        print("Edit button was tapped")
                        
                        if(viewModel.imageName == "heart.fill"){
                            viewModel.imageName = "heart"
                            
                        }else{
                            viewModel.imageName = "heart.fill"
                        }
                        
                    }) {
                        Image(systemName: viewModel.imageName)
                    }
                }
                
                HStack{
                    Image(systemName: "heart.fill")
                    Text("\(viewModel.movie?.vote_count ?? 0) Likes")
                    Spacer()
                        .frame(width: 40)
                    
                    Image(systemName: "person.3.fill")
                   
                    Text("\(String(format: "%.3f", viewModel.movie?.popularity ?? 0.0)) views")
                    
                }.font(.footnote)
                
                Spacer()
                    .frame(height: 10)
                
            }.foregroundColor(.white)
        
    }
}

// MARK: Card
struct MovieCard: View{
    var name: String
    var posterPath: String
    var genres: [Int]
    var releaseDate: String
    
    var body: some View {
        HStack{
            Image(uiImage: "https://image.tmdb.org/t/p/original/\(posterPath)".load()).resizable().frame(width: 60, height: 80)
            Spacer()
                .frame(width: 15)
            
            VStack(alignment: .leading, spacing: 2){
                Text(String(name))
                HStack{
                    Text(releaseDate).font(.footnote)
                    
//                    Text(genres).font(.footnote).foregroundColor(.gray)
                    
                }
            }.foregroundColor(.white)
            
        }.listRowBackground(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(viewModel: MovieViewModel())
    }
}
