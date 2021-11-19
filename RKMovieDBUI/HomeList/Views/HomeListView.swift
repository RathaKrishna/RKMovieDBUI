//
//  SettingsView.swift
//  RkMovieUI
//
//  Created by Rathakrishnan on 11/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeListView: View {
    
    @State private var isNavigationBarHidden = false
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        
        NavigationView {
            ZStack {
                if viewModel.isLoading {
                    ScrollView {
                        
                        moviesView
                        
                    }
                    
                }
                else
                {
                    ProgressView()
                        .foregroundColor(.primaryColor)
                }
                
                
            }
            .navigationBarHidden(false)
            .navigationBarTitle("Movies", displayMode: .inline)
        }
        
    }
}

extension HomeListView {
    
    var moviesView: some View {
        VStack {
            ForEach(viewModel.movies, id: \.self){ movie in
                NavigationLink(destination: MovieDetailView(series: movie)) {
                    HStack {
                        WebImage(url: URL(string: movie.posterUrl))
                            .resizable()
                            .placeholder(Image("no_movie"))
                            .frame(width: 90, height: 110)
                            .cornerRadius(5)
                            .clipped()
                            .padding(6)
                        
                        VStack(alignment: .leading) {
                            Text("\(movie.title)")
                                .font(.system(.title3, design: .rounded))
                                .foregroundColor(Color(.darkText))
                                .bold()
                            HStack {
                                ForEach(movie.genres, id: \.self){ genre in
                                                                    
                                    Text("\(genre)")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                            
                            Text("Directed by: \(movie.director)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            HStack{
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                Text("\(Int.random(in: 3..<5)) . \(Helpers().calculateTime(runTime: movie.runtime)) mins. $\(Int.random(in: 10..<100)) for two")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }.padding(.leading,4)
                        
                        Spacer()
                    }
                }
            }
        }
    }
}
struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListView()
    }
}
