//
//  SettingsView.swift
//  RKMovieDBUI
//
//  Created by Rathakrishnan on 22/11/21.
//

import SwiftUI
// TODO: functional settings
struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode

    @EnvironmentObject var modelData: ModelData
    
    //Initiate View Model
    var genres: [Genre]
    @State private var selectedGenre = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Movie Prefrence")) {
                    
                    Picker(selection: $selectedGenre, label: Text("Display Order")) {
                       
                        ForEach(genres.indices, id: \.self) { index in
                            Text(genres[index].title)
                        }
                    }
                }
            }
           
            .navigationBarTitle("Setting", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Cancel")
                    .foregroundColor(.primary)
            }), trailing: Button(action: {
                self.modelData.genreIndex = self.selectedGenre
                self.modelData.movieGenre = genres[self.selectedGenre].title
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Save")
                    .foregroundColor(.primary)
            }))
            
        }
        .onAppear {
            self.selectedGenre = modelData.genreIndex
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(genres: [Genre(title: "All")]).environmentObject(ModelData())
    }
}
