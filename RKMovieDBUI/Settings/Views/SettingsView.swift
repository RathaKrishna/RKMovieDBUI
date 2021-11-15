//
//  SettingsView.swift
//  RkMovieUI
//
//  Created by Rathakrishnan on 11/11/21.
//

import SwiftUI

struct SettingsView: View {
    
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

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
