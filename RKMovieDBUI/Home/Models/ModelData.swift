//
//  ModelData.swift
//  RKMovieDBUI
//
//  Created by Rathakrishnan on 16/11/21.
//

import Foundation
import Combine


final class ModelData: ObservableObject {
    
    @Published var movieData: MovieData = load("movie_db.json")
    var movies: [MovieData.Movie] {
        movieData.movies
        }
    
    var genres: [String] {
        movieData.genres
    }
    
    var categories: [[String]: [MovieData.Movie]] {
        Dictionary( grouping: movies, by: { $0.genres})
    }
}


func load<T: Decodable>(_ filename: String) -> T {
    
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else { fatalError("couldn't find \(filename) in main bundle") }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle: \n \(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self) : \n \(error)")
    }
}
