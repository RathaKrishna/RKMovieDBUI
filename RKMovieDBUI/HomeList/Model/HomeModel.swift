//
//  HomeModel.swift
//  RKMovieDBUI
//  Sample MVVM architecture Model
//  Created by Rathakrishnan on 19/11/21.
//

import Foundation

struct NowShowing: Codable, Hashable {
    var id: Int
    var title: String
    var year: String
    var runtime: String
    var genres: [String]
    var director: String
    var actors: String
    var plot: String
    var posterUrl: String
    var isFavorite: Bool
    
}

struct Genre: Codable, Hashable {
    var title: String
    
}

struct Movie: Codable, Hashable {
    var id: Int
    var title: String
    var year: String
    var runtime: String
    var genres: [String]
    var director: String
    var actors: String
    var plot: String
    var posterUrl: String
    var isFavorite: Bool
    
}

extension String {
    var calculatedTime: String {
        let dRunTime = (self as NSString).doubleValue
        let toSeconds = dRunTime * 60.0
        let result = toSeconds.asString(style: .abbreviated)
        return result
    }
}
