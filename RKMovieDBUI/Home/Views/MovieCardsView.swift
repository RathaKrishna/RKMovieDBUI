//
//  MovieCardsView.swift
//  RkMovieUI
//
//  Created by Rathakrishnan on 12/11/21.
//

import SwiftUI

struct MovieCardsView: View {
    
    let imageName: String
    let title: String
    let ratings: String
    
    let gradient = Gradient(colors: [Color(red: 251/255, green: 255/255, blue: 255/255, opacity: 0.5),Color(red: 251/255, green: 255/255, blue: 255/255, opacity: 0.3),  .clear])
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                
                RemoteImage(url: self.imageName)
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .cornerRadius(15)
                    .overlay(
                        
                        RoundedRectangle(cornerRadius: 15.0)
                                .fill(LinearGradient(gradient: gradient, startPoint: .bottom, endPoint: .top))
                                .overlay(
                                    VStack {
                                        HStack(alignment: .center) {
                                            Spacer()
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.yellow)
                                                .font(.system(size: 22))
                                            
                                           Text("\(ratings)")
                                            .font(.system(size: 18, weight: .bold, design: .rounded))
                                            .foregroundColor(.white)
                                            
                                        }
                                        .padding()
                                        
                                        Spacer()
                                        
                                        Text(self.title)
                                        .font(.system(.title2, design: .rounded))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(width: geometry.size.width, alignment: .bottomLeading)
                                        
                                       
                                    }
                                )
                                .frame(width: geometry.size.width, height: geometry.size.height , alignment: .bottomLeading)
                                
                                
                                
                        
                    )
            }
        }
    }
}

struct MovieCardsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardsView(imageName: seriesList[0].image, title: seriesList[0].title, ratings: "4.5")
    }
}
