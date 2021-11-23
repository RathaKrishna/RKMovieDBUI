//
//  SettingsView.swift
//  RkMovieUI
//
//  Created by Rathakrishnan on 11/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeListView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    
    @State private var isNavigationBarHidden = true
    @State private var showSetting = false
    var body: some View {
        
        VStack {
            ZStack {
                if viewModel.isLoading {
                    VStack {
                        topView
                            .padding(.all, 10)
                        ScrollView {
                            nowShowingView
                                .frame(height: 300)
                                .padding()
                            moviesView
                        }
                    }
                    
                    
                }
                else
                {
                    ProgressView()
 
                }
                
            }
            .sheet(isPresented: $showSetting, content: {
                SettingsView(genres: viewModel.genres)
            })
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear() {
                self.isNavigationBarHidden = true
                
            }
            
            
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
    
    var nowShowingView: some View {
        PageView(pages: viewModel.nowShowing.map {
            PageCardView(image: $0.posterUrl, title: $0.title)
            
        })
    }
    
    var topView: some View {
        HStack {
            RoundedRectangle(cornerRadius: 2)
                .fill(Color.primaryColor)
                .frame(width: 10, height: 60)
                
            VStack(alignment: .leading) {
                Text("Hello Ratha")
                    .font(.system(.headline, design: .rounded))
                    .fontWeight(.bold)
                Text("Movies from network api")
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.secondary)
            }
            Spacer()
            Button(action: {
                self.showSetting = true
            }){
                Image(systemName: "gear")
                    .font(.system(size: 28))
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct PageCardView: View {
    var image: String
    var title: String
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            WebImage(url: URL(string: image))
                .placeholder(Image("no_movie"))
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            
            TextOverlay(title: title)
            
        }
    }
}

struct TextOverlay: View {
    var title: String
    var gradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.6), Color.black.opacity(0)]), startPoint: .bottom, endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
            VStack(alignment: .leading){
                Text(title)
                    .font(.system(.title, design: .rounded))
                    .bold()
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeListView()
            PageCardView(image: "https://m.media-amazon.com/images/M/MV5BMTg0NTM3MTI1MF5BMl5BanBnXkFtZTgwMTAzNTAzNzE@._V1_.jpg", title: "Movie title")
        }
    }
}
