//
//  RKMovieDBUIApp.swift
//  RKMovieDBUI
//
//  Created by Rathakrishnan on 12/11/21.
//


import SwiftUI

@main
struct RKMovieDBUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
