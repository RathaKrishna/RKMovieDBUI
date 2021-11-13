//
//  SearchListView.swift
//  RkMovieUI
//
//  Created by Rathakrishnan on 11/11/21.
//

import SwiftUI

struct SearchListView: View {
    
    @State private var isNavigationBarHidden = false
    
    var body: some View {
        
        NoDataView()
            .navigationTitle(Text("Search"))
            .navigationBarHidden(self.isNavigationBarHidden)
        
            .onAppear() {
                self.isNavigationBarHidden = false
            }
    }
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListView()
    }
}
