//
//  ModelData.swift
//  RKMovieDBUI
//  Example Combine Object 
//  Created by Rathakrishnan on 16/11/21.
//

import Foundation
import Combine


final class ModelData: ObservableObject {
    
    @Published var movieData: MovieData = load("movie_db.json")
    
    init() {
        UserDefaults.standard.register(defaults: [
                                        "view.prefrence.movieGenre" : "All" ,
                                        "view.prefrence.genreIndex" : 0 ])
    }
    
    @Published var movieGenre: String = UserDefaults.standard.string(forKey: "view.prefrence.movieGenre") ?? "All" {
        didSet {
            UserDefaults.standard.set(movieGenre, forKey: "view.prefrence.movieGenre")
        }
    }
    
    @Published var genreIndex: Int = UserDefaults.standard.integer(forKey: "view.prefrence.genreIndex") {
        didSet {
            UserDefaults.standard.set(genreIndex, forKey: "view.prefrence.genreIndex")
        }
    }
    
    
    var movies: [Movie] {
        movieData.movies
        }
    
    var genres: [String] {
        movieData.genres
    }
    // TODO: - Filter by categories
    var categories: [[String]: [Movie]] {
        Dictionary( grouping: movies, by: { $0.genres})
    }
   
    
    
    
    
}


//load local file 
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
