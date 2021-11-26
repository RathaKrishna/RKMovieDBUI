//
//  TabBarView.swift
//  RkMovieUI
//
//  Created by Rathakrishnan on 11/11/21.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selectedTab: Tab = .home
    
    enum Tab {
        case home
        case setting
    }
    init() {
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().isOpaque = false
        UIWindow.appearance().overrideUserInterfaceStyle = .dark
    }
    var body: some View {
               
        NavigationView {
            TabView(selection: $selectedTab) {
                        HomeView()
                            
                            .tabItem {
                                Image(systemName: self.selectedTab == .home ? "house.fill" : "house")
                                Text("Local")
                            }
                            .tag(Tab.home)
                        
                        HomeListView()
                            .tabItem {
                                Image(systemName: self.selectedTab == .setting ? "film.fill" : "film")
                                Text("Network")
                            }
                            .tag(Tab.setting)
                            
                    }
                   
            .accentColor(.primaryColor)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
                
  
        
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .preferredColorScheme(.light)
    }
}
