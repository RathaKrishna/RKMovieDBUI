//
//  TabBarView.swift
//  RkMovieUI
//
//  Created by Rathakrishnan on 11/11/21.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationView {
               
                TabView(selection: $selectedTab) {
                    HomeListView()
                        .tabItem {
                            Image(systemName: self.selectedTab == 0 ? "house.fill" : "house")
                            Text("Home")
                        }
                        .tag(0)
                    
                    SearchListView()
                        .tabItem {
                            Image(systemName: self.selectedTab == 1 ? "magnifyingglass.circle.fill" : "magnifyingglass.circle")
                            Text("Search")
                        }
                        .tag(1)
                }
               
                .accentColor(.red)
  
        }
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
