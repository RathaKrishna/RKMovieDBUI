//
//  MovieDetailView.swift
//  RKMovieDBUI
//
//  Created by Rathakrishnan Ramasamy on 13/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailView: View {
    
    @EnvironmentObject var modelData: ModelData
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var series: Movie

    var movieIndex: Int {
        modelData.movieData.movies.firstIndex(where: {$0.id == series.id})!
    }
    
    
    @State private var isFavo = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    
                    DetailsHeaderImageView(series: series)
                    
                    VStack(alignment: .leading) {
                        Text("Story")
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                            .padding(.bottom, 20)
                        Text(series.plot)
                            .font(.system(.body, design: .rounded))
                            .frame(minWidth: 0, maxWidth: .infinity)
                        
                    }
                    .padding()
  
                    VStack(alignment: .leading) {
                        Text("Cast")
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                            .padding(.bottom, 20)
                        ScrollView(.horizontal, showsIndicators: false, content: {
                            HStack(spacing: 10) {
                                ForEach(getCasts(str: series.actors), id: \.self) { cast in
                                    VStack(alignment: .center) {
                                        Image("avatar_img")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 90, height: 90, alignment: .center)
                                            .cornerRadius(45.0)
                                        
                                        Spacer()
                                            
                                        Text(cast)
                                            .font(.body)
                                            .multilineTextAlignment(.center)
                                            .frame(width: 110)
                                        Spacer()
      
                                    }
                                    
                                    
                                }
                            }
                        })
                        
                    }
                    .padding()
                    
                    Button(action: {}, label: {
                        Text("Reserve Seat")
                            .font(.system(.title, design: .rounded))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)

                    })
                    .buttonStyle(GradientButtonStyle())
                    .padding()

                    
                    
                    Spacer()
                }
               
            }
            .ignoresSafeArea( edges: .top)
            .navigationBarHidden(true)
            
            HStack{
                Image(systemName: "chevron.backward.circle.fill")
                    .font(.system(size: 44))
                    .foregroundColor(.white)
                    
                    .padding()
                    .onTapGesture {
                        mode.wrappedValue.dismiss()
                }
                
                Spacer()
                
                FavoriteButton(isSet: $modelData.movieData.movies[movieIndex].isFavorite)
                    .font(.system(size: 38))
                    .padding()
                

            }
            .frame(minWidth: 0,  maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        }
        
    }
    
    func getCasts(str: String) -> Array<String> {
        let array = str.components(separatedBy: ",")
        return array
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    
    
    
    static var previews: some View {
        MovieDetailView(series: ModelData().movieData.movies[1])
            .environmentObject(ModelData())
            
            
    }
}

struct DetailsHeaderImageView: View {
    
    var series: Movie
    
    private let gradient = Gradient(colors: [Color(red: 251/255, green: 255/255, blue: 255/255, opacity: 0.5),Color(red: 251/255, green: 255/255, blue: 255/255, opacity: 0.3),  .clear])
    
    var body: some View {
        ZStack {
            WebImage(url: URL(string: series.posterUrl))
                .resizable()
                .placeholder(Image("no_movie"))
                .aspectRatio(1.1, contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 400)
                .offset(y: -10)
                
            Rectangle()
                .fill(LinearGradient(gradient: gradient, startPoint: .bottom, endPoint: .top))
                .overlay(
                    VStack {
                        Spacer()
                        Text(series.title)
                            .font(.system(.title, design: .rounded))
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                        
                        HStack {
                            Text(series.year)
                                .font(.system(.title3, design: .rounded))
                                .foregroundColor(.white)
                            Circle()
                                .foregroundColor(Color.white.opacity(1))
                                .frame(width: 8, height: 8, alignment: .center)
                            ForEach(series.genres.indices, id: \.self){ index in
                                Text(series.genres[index])
                                    .font(.system(.title3, design: .rounded))
                                    .foregroundColor(.white)
                            }
                            Circle()
                                .foregroundColor(Color.white.opacity(1))
                                .frame(width: 8, height: 8, alignment: .center)
                            Text(series.runtime.calculatedTime)
                                .font(.system(.title3, design: .rounded))
                                .foregroundColor(.white)
                            
                            
                        }
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .font(.system(size: 22))
                            
                            Text("4.9")
                                .font(.system(.title3, design: .rounded))
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                )
        }
          
    }
    
   
}


struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button(action: { self.isSet.toggle()}) {
            Image(systemName: isSet ? "heart.fill" : "heart")
                .foregroundColor(isSet ? .btnBgColor : .white)
                
        }
        .buttonStyle(FavoriteButtonStyle())
        .animation(Animation.interactiveSpring())
    }
}

extension Double {
  func asString(style: DateComponentsFormatter.UnitsStyle) -> String {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.hour, .minute]
    formatter.unitsStyle = style
    return formatter.string(from: self) ?? ""
  }
}

