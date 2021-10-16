//
//  ContentView.swift
//  Mobile2You
//
//  Created by Rychillie Umpierre de Oliveira on 16/10/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = MovieViewModel()
    
    var body: some View{
        Text("Hello, world!")
            .padding()
            .onAppear {
                viewModel.fetchData()
            }
    }
}

struct ContentView_previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
