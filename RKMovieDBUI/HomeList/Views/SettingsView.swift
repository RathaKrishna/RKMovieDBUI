//
//  SettingsView.swift
//  RKMovieDBUI
//
//  Created by Rathakrishnan on 22/11/21.
//

import SwiftUI
// TODO: functional settings
struct SettingsView: View {
    
    var genres: [Genre]
    @State private var selectedOrder = "All"
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Movie Prefrence")) {
                    
                    Picker(selection: $selectedOrder, label: Text("Display Order")) {
                        ForEach(genres, id: \.self) { genre in
                            Text(genre.title)
                        }
                    }
                }
            }
            .onAppear {
                self.selectedOrder = "All"
            }
            .navigationBarTitle("Setting", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {}, label: {
                Text("Cancel")
                    .foregroundColor(.primary)
            }), trailing: Button(action: {}, label: {
                Text("Save")
                    .foregroundColor(.primary)
            }))
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(genres: [Genre(title: "All")])
    }
}
