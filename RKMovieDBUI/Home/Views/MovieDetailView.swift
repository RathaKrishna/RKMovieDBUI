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
                                    VStack {
                                        Image("avatar_img")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 80, height: 80, alignment: .center)
                                            .cornerRadius(40.0)
                                        Spacer()
                                            
                                        Text(cast)
                                            .font(.body)
                                            .frame(width: 100, alignment: .center)
                                            
                                        
                                        

                                            
                                        
                                            
                                           
                                    }
                                    
                                    
                                }
                            }
                        })
                        
                    }
                    .padding()
                    
                    Button(action: {
                        
                    }) {
                        Text("Reserve Seat")
                            .font(.system(.title, design: .rounded))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding()
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(10.0)
                    .padding(.all, 20)
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
    
    func getCasts(str: String) -> Array<String> {
        let array = str.components(separatedBy: ",")
        var name: Int = 0
        return array
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    
    
    
    static var previews: some View {
        MovieDetailView(series: MovieData.Movies.init(id: 0, title: "The Cotton Club", year: "1984", runtime: "67", genres: ["drama", "Adventure"], director: "Francis Ford Coppola", actors: "Richard Gere, Gregory Hines, Diane Lane, Lonette McKee", plot: "The Cotton Club was a famous night club in Harlem. The story follows the people that visited the club, those that ran it, and is peppered with the Jazz music that made it so famous.", posterUrl: "https://images-na.ssl-images-amazon.com/images/M/MV5BMTU5ODAyNzA4OV5BMl5BanBnXkFtZTcwNzYwNTIzNA@@._V1_SX300.jpg"))
    }
}

struct DetailsHeaderImageView: View {
    
    var series: MovieData.Movies
    
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
                            Text(calculateTime(runTime: series.runtime))
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
    
    func calculateTime(runTime: String) -> String {
        let dRunTime = (runTime as NSString).doubleValue
        let toSeconds = dRunTime * 60.0
        let result = toSeconds.asString(style: .abbreviated)
        return result
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
