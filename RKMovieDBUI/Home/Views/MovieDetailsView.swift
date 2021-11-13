//
//  MovieDetailsView.swift
//  RKMovieDBUI
//
//  Created by Rathakrishnan on 13/11/21.
//

import SwiftUI

struct MovieDetailsView: View {
    @Binding var isShow: Bool
    
    @State var seriesModel: Series
    
    var body: some View {
        BottomSheet(isShow: $isShow) {
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ZStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Image("movie_1")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .padding(.bottom, 20)
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(seriesModel.title)
                                    .font(.system(.title, design: .rounded))
                                    .fontWeight(.heavy)
                           
                            
                            Group {
                                
                                HStack(spacing: 3) {
                                    ForEach(0...4, id: \.self) { _ in
                                        Image(systemName: "star.fill")
                                            .font(.system(size: 15))
                                            .foregroundColor(.yellow)
                                    }
                                    
                                    Text(seriesModel.ratings)
                                        .font(.system(.headline))
                                        .padding(.leading, 10)
                                }
                            }
                            }
                            .padding(.bottom, 30)
                            Text("Description")
                                .font(.system(.headline, design: .rounded))
                                .fontWeight(.medium)
                            Text("Growing up in Michigan, I was lucky enough to experi ence one part of the Great Lakes. And let me assure you, they are great. As a phot ojournalist, I have had endless opportunities to travel the world and to see a var iety of lakes as well as each of the major oceans. And let me tell you, you will b e hard pressed to find water as beautiful as the Great Lakes.")
                                .padding(.bottom, 40)
                            
                            Button(action: {}) {
                                Text("Book Now")
                                    .font(.system(.headline, design: .rounded))
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(minWidth: 0 , maxWidth: .infinity)
                                    .background(Color(red: 0.97, green: 0.369, blue: 0.212))
                                    .cornerRadius(20)
                                    
                            }
                        }
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,  maxHeight: .infinity)
                        .background(Color(.systemBackground))
                        .cornerRadius(15)
                        
                        Image(systemName: "bookmark.fill")
                            .font(.system(size: 48))
                            .foregroundColor(Color(red: 0.97, green: 0.369, blue: 0.212))
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,  maxHeight: .infinity, alignment: .topTrailing)
                            .offset(x: -15, y: -5)
                    }
                    .offset(y: 15)
                }
            
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(isShow: .constant(false), seriesModel: seriesList[0])
    }
}
