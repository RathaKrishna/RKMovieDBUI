//
//  HomeListView.swift
//  RkMovieUI
//  Example view which loads data from local file
//  Created by Rathakrishnan on 11/11/21.
//

import SwiftUI
import CoreData


struct HomeView: View {
    
    @EnvironmentObject var modelData: ModelData
    
    @State private var isNavigationBarHidden = true
    @State private var searchText = ""
    @State private var movieType: MoviesType = .all
    
    //LazyVGrid layout
    @State private var gridLayout: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    @State private var gridLayoutCount = 2
    
    @State private var showDetails = false
    @State private var selectedSeries = nowShowingList[0]
    
    var body: some View {
            ZStack {
                GeometryReader { geometry in
                    
                    VStack {
                        TopBarView()
                            .padding(.all, 10)
                            .onTapGesture {
                                if self.gridLayoutCount == 2 {
                                    self.gridLayoutCount = 1
                                }  else { self.gridLayoutCount = 2 }
                            }
                        
                        ScrollView{
                            
                            VStack {
                                SearchBarView(text: $searchText, gridLayouCount: $gridLayoutCount)
                                CategoryView(movieType: $movieType)
                                    .padding(.leading, 20)
                                    .padding(.vertical, 10)
                                NowShowingView(showDetails: $showDetails, movieType: self.movieType, selectedSeries: $selectedSeries)
                                    .padding(.leading, 20)
                                    .padding(.vertical, 10)
                                TrendingView(gridLayout: gridLayout, moviesList: modelData.movies)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 10)
                            }
                            .onChange(of: self.gridLayoutCount, perform: { value in
                                if self.gridLayoutCount == 1 {
                                    self.gridLayout = [GridItem(.flexible())]
                                }
                                else
                                {
                                    self.gridLayout = [GridItem(.flexible()), GridItem(.flexible())]
                                }
                            })
                        }
                        
                        
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(self.isNavigationBarHidden)
                        .onAppear() {
                            self.isNavigationBarHidden = true
                            
                        }
                        
                    }
                }
                
                if showDetails {
                    
                    BlankView(bgColor: .black)
                        .opacity(0.3)
                        .onTapGesture {
                            self.showDetails = false
                        }
                    // show custom bottom view 
                    BottomDetailsView(isShow: $showDetails, seriesModel: selectedSeries)
                        .transition(.move(edge: .bottom))
                        .animation(.easeOut(duration: 0.2))
                    
                }
                
            }
        
        
        
    }
}

//Navigation bar
struct TopBarView: View {
    
    var body: some View {
        HStack(alignment: .center){
            
            AvatarView(image: "avatar_img", width: 60, height: 60)
                .padding(.horizontal, 10)
            
            VStack(alignment: .leading) {
                Text("Hello Ratha")
                    .font(.system(.headline, design: .rounded))
                    .fontWeight(.bold)
                Text("Book your favorite movies")
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.secondary)
                
            }
            
            Spacer()
            
            Image(systemName: "bell.fill")
                .font(.system(size: 26))
                .padding(.horizontal,10)
                .overlay(
                    Circle()
                        .frame(width: 12, height: 12, alignment: .topTrailing)
                        .foregroundColor(.red)
                        .padding(.bottom, 16)
                        .padding(.leading,16)
                    
                )
            
        }
    }
}

// avatar image view
struct AvatarView: View {
    let image: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: width, height: height)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.red, lineWidth: 1))
    }
}

//Movies category view , Load from sample model data
struct CategoryView: View {
    
    @Binding var movieType: MoviesType
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Movie Categories")
                .font(.system(size: 25, weight: .bold, design: .rounded))
                .padding(.bottom, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack {
                    ForEach(catogries){ catogry in
                        
                        Button(action: {
                            self.movieType = catogry.type
                        }, label: {
                            Text(catogry.title)
                                .font(.system(.title, design: .rounded))
                                .foregroundColor(.white)
                                .fontWeight(.regular)
                                .padding()
                                .padding(.horizontal, 20)
                        })
                        .buttonStyle(BlackButtonStyle(isSelected: movieType == catogry.type ? true : false))
                        
                        
                        
                        /*self.movieType == catogry.type ? BlackButtonStyle :*/
                    }
                }
                
            }
        }
        
    }
}

//Example view for load data from local model data
struct NowShowingView: View {
    
    @Binding var showDetails: Bool
    
    var movieType: MoviesType
    @Binding var selectedSeries: Series
    var body: some View {
        VStack(alignment: .leading) {
            Text("Now Showing")
                .font(.system(size: 25, weight: .bold, design: .rounded))
                .padding(.bottom, 20)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(movieType == MoviesType.all ? nowShowingList :  nowShowingList.filter { $0.type == movieType}) { series in
                        
                        MovieCardsView(imageName: series.image, title: series.title, ratings: series.ratings, showFavorite: false )
                            .frame(width: 200, height: 300)
                            .onTapGesture {
                                self.selectedSeries = series
                                self.showDetails = true
                            }
                        
                    }
                }
            }
            
        }
    }
}

//Example view for load data from local Json file
struct TrendingView: View {
    
    var gridLayout: [GridItem]
    var moviesList: [Movie]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Treding")
                .font(.system(size: 25, weight: .bold, design: .rounded))
                .padding(.bottom, 20)
            
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                
                ForEach(moviesList, id:\.self) { movie in
                    
                    NavigationLink(destination: MovieDetailView(series: movie)) {
                        MovieCardsView(imageName: movie.posterUrl, title: movie.title, ratings: "4.5", showFavorite: true, isFavotire: movie.isFavorite)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 200)
                            .animation(.interactiveSpring())
                    }
                    
                }
            }
        }
        
        
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ModelData() )
    }
}
