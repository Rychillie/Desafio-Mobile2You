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
        ZStack {
            ScrollView {
                Color.black.edgesIgnoringSafeArea(.all)
                MovieHeaderView().environmentObject(viewModel)
                MovieListView().environmentObject(viewModel)
            }
        }.ignoresSafeArea()
            .onAppear {
            MovieAPI().getFirstMovie(id: viewModel.firstIdMovie) { movie in
                viewModel.movie = movie
            }
            viewModel.fetchMovieSimilarList()
            viewModel.fetchGeneres()
        }
    }
}

struct MovieHeaderView: View {
    @EnvironmentObject var viewModel: MovieViewModel
    
    internal let imageEffect: LinearGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black,Color.clear]),
        startPoint: .center, endPoint: .bottom
    )
    
    var body: some View {
        VStack(){
            Image(uiImage: "https://image.tmdb.org/t/p/original/\(viewModel.movie?.poster_path ?? "")".load())
                .resizable()
                .mask(self.imageEffect)
                .scaledToFit()
                .padding(.top, -20)
            HStack {
                Text(viewModel.movie?.original_title ?? "").foregroundColor(.white)
                    .font(.system(size: 24))
                    .fontWeight(.black)
                    .padding(.leading, 20)
                Spacer()
                Button {
                    viewModel.isFavorite.toggle()
                } label: {
                    Image(systemName: viewModel.imageName)
                        .resizable()
                        .frame(width: 20,height: 20)
                        .foregroundColor(.white)
                        .padding(.trailing, 20)
                }
                
            }
            HStack(alignment: .firstTextBaseline) {
                HStack{
                    Image(systemName: "heart.fill").resizable()
                        .frame(width: 15,height: 15)
                        .foregroundColor(.white)
                    Text(String(format: "%@ Likes",String(viewModel.movie?.vote_count ?? 0)))
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                }
                HStack{
                    Image(systemName: "flame").resizable()
                        .frame(width: 15,height: 15)
                        .foregroundColor(.white)
                    Text("\((viewModel.movie?.popularity ?? 0.0).formatToK())K Views")
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                }.padding(.leading,20)
                Spacer()
            }.padding(.horizontal,20)
        }.padding(.bottom,20)
    }
}

struct MovieListView: View {
    @EnvironmentObject var viewModel: MovieViewModel
    
    @State var checked: Bool = false;
    
    var body: some View {
        VStack{
            ForEach(viewModel.movieSimilarList, id: \.self) { movie in
                MovieListItemView(
                    checked: checked,
                    title: movie.title ?? "",
                    date: movie.releaseDate ?? "",
                    image: movie.posterPath ?? "",
                    geners: ["action", "drama", "anime"]
                )
            }
        }
    }
}

struct MovieListItemView: View {
    @State var checked: Bool
    var title: String
    var date: String
    var image: String
    var geners: [String]
    
    var body: some View {
        HStack{
            Image(uiImage: "https://image.tmdb.org/t/p/original/\(image)".load())
                .resizable()
                .frame(
                    width: 60,
                    height: 100
                )
            VStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                HStack{
                    Text(date.prefix(4))
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                    ForEach(geners, id: \.self) { item in
                        Text(item)
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                    }
                }
            }.padding(10)
            Spacer()
            Button {
                self.checked.toggle()
            } label: {
                Image(systemName: self.checked ? "checkmark.circle.fill" : "checkmark.circle")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(
                        width: 15,
                        height: 15
                    )
            }.padding(.trailing,20)
        }.padding(0)
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(viewModel: MovieViewModel())
    }
}
