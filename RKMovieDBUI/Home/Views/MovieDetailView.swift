//
//  MovieDetailView.swift
//  RKMovieDBUI
//
//  Created by Rathakrishnan Ramasamy on 13/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var series: MovieData.Movies
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    
                    WebImage(url: URL(string: series.posterUrl))
                        .resizable()
                        .placeholder(Image("no_movie"))
                        .aspectRatio(1.1, contentMode: .fill)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 400)
                        .offset(y: -10)
                    
  
                    
                    Spacer()
                }
               
            }
            .ignoresSafeArea( edges: .top)
            .navigationBarHidden(true)
            
            Image(systemName: "chevron.backward.circle.fill")
                .font(.system(size: 44))
                .foregroundColor(.white)
                .frame(minWidth: 0,  maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .padding()
                .onTapGesture {
                    mode.wrappedValue.dismiss()
                }
        }
        
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    
    
    
    static var previews: some View {
        MovieDetailView(series: MovieData.Movies.init(id: 0, title: "The Cotton Club", year: "1984", runtime: "127", genres: ["drama"], director: "Francis Ford Coppola", actors: "Richard Gere, Gregory Hines, Diane Lane, Lonette McKee", plot: "The Cotton Club was a famous night club in Harlem. The story follows the people that visited the club, those that ran it, and is peppered with the Jazz music that made it so famous.", posterUrl: "https://images-na.ssl-images-amazon.com/images/M/MV5BMTU5ODAyNzA4OV5BMl5BanBnXkFtZTcwNzYwNTIzNA@@._V1_SX300.jpg"))
    }
}
