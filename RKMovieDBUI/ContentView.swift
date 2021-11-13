//
//  ContentView.swift
//  RKMovieDBUI
//
//  Created by Rathakrishnan on 12/11/21.
//

import SwiftUI

struct ContentView: View {
  

    var body: some View {
        
        TabBarView()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
