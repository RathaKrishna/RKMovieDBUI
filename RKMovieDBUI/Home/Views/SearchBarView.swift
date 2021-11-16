//
//  SearchBarView.swift
//  RkMovieUI
//
//  Created by Rathakrishnan on 11/11/21.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var text: String
    @Binding var gridLayouCount: Int
    
    @State private var isEditing = false
    
    //custom binding example
    private var searchText: Binding<String> {
        
        Binding<String>(
            get: {
                self.text.capitalized
            }, set: {
                self.text = $0
            })
    }
    
    var body: some View {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color(.systemGray6))
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color("icon_bg_color"))
                            .frame(width: 25, height: 25)
                            .padding(.leading, 10)
                        TextField("Search for Movies", text: searchText)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding(7)
                            .background(Color(.clear))
                            .onTapGesture {
                                self.isEditing = true
                            }
                        
                        if isEditing {
                            Button(action: {
                                self.text = ""
                                self.isEditing = false
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(Color("icon_bg_color"))
                                    .frame(width: 25, height: 25)
                                    .padding(.trailing, 10)
                                    
                            }
                        }
                        else
                        {
                            Image("ic_filter")
                                .frame(width: 22, height: 25)
                                .padding(.trailing, 15)
                                .onTapGesture {
                                    if self.gridLayouCount == 2 {
                                        self.gridLayouCount = 1
                                    }  else { self.gridLayouCount = 2 }
                                }
                        }
                       
                    }
            )
                .frame(height: 50)
                .padding(.all, 20)

        
           
        
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(text: .constant(""), gridLayouCount: .constant(2))
            .preferredColorScheme(.dark)
    }
}
