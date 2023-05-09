//
//  ContentView.swift
//  coredataSetUp
//
//  Created by Dip Dutt on 23/3/23.
//

import SwiftUI

struct ContentView: View {
    @State var textTitle:String = ""
    let coreDM:coredataManager
     @State var Movies:[Movie] = []
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                TextField("Enter the movie Title", text: $textTitle)
                    .textFieldStyle(.roundedBorder)
                Button("Save") {
                    coreDM.saveMovie(title: textTitle)
                    Movies = coreDM.fetchMovies()
                }
                Spacer()
                
                List(Movies,id:\.self) { movies in
                    Text(movies.title ?? "")
                }
            }
            .padding()
            .navigationTitle("Movies")
            .onAppear {
                Movies = coreDM.fetchMovies()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: coredataManager())
    }
}
