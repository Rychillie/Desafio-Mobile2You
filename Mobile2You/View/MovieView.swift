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
            Color.black.edgesIgnoringSafeArea(.all)
            MovieHeaderView().environmentObject(viewModel)
        }.onAppear {
            MovieAPI().getFirstMovie(id: viewModel.firstIdMovie) { movie in
                viewModel.movie = movie
            }
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
        VStack{
            Image(uiImage: "https://image.tmdb.org/t/p/original/\(viewModel.movie?.poster_path ?? "")".load())
                .resizable()
                .mask(self.imageEffect)
                .scaledToFit()
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
                    Text(String(format: "%d Views",String(viewModel.movie?.popularity ?? 0)))
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                }.padding(.leading,20)
                Spacer()
            }.padding(.horizontal,20)
        }.padding(.bottom,20)
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(viewModel: MovieViewModel())
    }
}
