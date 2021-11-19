//
//  SettingStore.swift
//  RKMovieDBUI
//
//  Created by Rathakrishnan on 19/11/21.
//

import Foundation
import Combine

final class SettingStore: ObservableObject {
    init() {
        UserDefaults.standard.register(defaults: [
                                        "view.prefrence.movieGenre" : "All" ])
    }
    
    @Published var movieGenre: String = UserDefaults.standard.string(forKey: "view.prefrence.movieGenre") ?? "All" {
        didSet {
            UserDefaults.standard.set(movieGenre, forKey: "view.prefrence.movieGenre")
        }
    }
}
