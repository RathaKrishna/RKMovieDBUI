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
    }
    var body: some View {
        NavigationView {
               
                TabView(selection: $selectedTab) {
                    HomeListView()
                        .tabItem {
                            Image(systemName: self.selectedTab == .home ? "house.fill" : "house")
                            Text("Home")
                        }
                        .tag(Tab.home)
                    
                    SettingsView()
                        .tabItem {
                            Image(systemName: self.selectedTab == .setting ? "gearshape.fill" : "gearshape")
                            Text("Settings")
                        }
                        .tag(Tab.setting)
                }
               
                .accentColor(.primaryColor)
                
  
        }
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .preferredColorScheme(.light)
    }
}
