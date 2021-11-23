//
//  MovieDetailsView.swift
//  RKMovieDBUI
//
//  Created by Rathakrishnan on 13/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

//sample view for using Bottom sheet

struct BottomDetailsView: View {
    @Binding var isShow: Bool
    
    @State var seriesModel: Series
    
    var body: some View {
        BottomSheet(isShow: $isShow) {
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ZStack {
                        VStack(alignment: .leading, spacing: 5) {
                            WebImage(url: URL(string: seriesModel.image ))
                                .placeholder(Image("no_movie"))
                                .resizable()
                                .aspectRatio(1.1, contentMode: .fill)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 300)
                                .offset(y: -10)
                                
                                .padding(.bottom, 25)

                            
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
                            .padding(.bottom, 20)
                            Text("Description")
                                .font(.system(.headline, design: .rounded))
                                .fontWeight(.medium)
                            Text("The Cotton Club was a famous night club in Harlem. The story follows the people that visited the club, those that ran it, and is peppered with the Jazz music that made it so famous. The Cotton Club was a famous night club in Harlem. The story follows the people that visited the club, those that ran it, and is peppered with the Jazz music that made it so famous.")
                                .padding(.bottom, 20)
                            
                            Button(action: {}) {
                                Text("Book Now")
                                    .font(.system(.headline, design: .rounded))
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(minWidth: 0 , maxWidth: .infinity)
                                    .background(Color.btnBgColor)
                                    .cornerRadius(20)
                                    
                            }
                        }
                        .padding(.all, 10)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,  maxHeight: .infinity)
                        .background(Color(.systemBackground))
                        .cornerRadius(15)
                        
                        Image(systemName: "bookmark.fill")
                            .font(.system(size: 48))
                            .foregroundColor(.btnBgColor)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,  maxHeight: .infinity, alignment: .topTrailing)
                            .offset(x: -15, y: -5)
                    }
                    .offset(y: 0)
                }
            
        }
    }
}

struct BottomDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        BottomDetailsView(isShow: .constant(false), seriesModel: nowShowingList[0])
    }
}
