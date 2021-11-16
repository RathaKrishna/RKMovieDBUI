//
//  MovieModel.swift
//  RkMovieUI
//
//  Created by Rathakrishnan on 11/11/21.
//

import Foundation


//Model for local json file
struct MovieData:  Codable {
    
    
    var genres: [String]
    var movies: [Movie]
    
    struct Movie: Hashable, Codable {
        
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
}

//models for now showing *** example for read data from local model
enum MoviesType {
    case all
    case action
    case comedy
    case drama
    case fantasy
    case horror
    case mystery
    case romance
    case adventure
    
}

struct MovieCatogery: Identifiable {
    var id = UUID()
    var title: String
    var type: MoviesType
        
}

struct Series: Identifiable {
    var id = UUID()
    var title: String
    var year: String
    var type: MoviesType
    var image: String
    var ratings: String
}

//sample data

#if DEBUG
let catogries = [
    MovieCatogery(title: "All", type: .all),
    MovieCatogery(title: "Action", type: .action),
    MovieCatogery(title: "Comedy", type: .comedy),
    MovieCatogery(title: "Drama", type: .drama),
    MovieCatogery(title: "Fantasy", type: .fantasy),
    MovieCatogery(title: "Horror", type: .horror),
    MovieCatogery(title: "Mystery", type: .mystery),
    MovieCatogery(title: "Romance", type: .romance),
    MovieCatogery(title: "Adventure", type: .adventure)]

#endif



#if DEBUG
let seriesList = [
    Series(
        title: "Hello, My Name Is Doris",
        year: "2015",
        type: .drama,
        image: "https://m.media-amazon.com/images/M/MV5BMTg0NTM3MTI1MF5BMl5BanBnXkFtZTgwMTAzNTAzNzE@._V1_.jpg",
        ratings: "4.3"),
    Series(
        title: "Hello, Jack! The Kindness Show",
        year: "2021",
        type: .comedy,
        image: "https://m.media-amazon.com/images/M/MV5BMjdhMzY3NzYtMjkzZC00YmY3LThlM2MtNDVhNjUyMTEwYTMzXkEyXkFqcGdeQXVyMDU5MDEyMA@@._V1_.jpg",
        ratings: "3.9"),
    Series(
        title: "Prom Night II",
        year: "1987",
        type: .horror,
        image: "https://m.media-amazon.com/images/M/MV5BZGFmZjQ0ZTYtNjNkOC00OTAxLTlmMWMtNThmMWRkMTcyODY0XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg",
        ratings: "4.2"),
    Series(
        title: "Hello, Dolly!",
        year: "1969",
        type: .adventure,
        image: "https://m.media-amazon.com/images/M/MV5BODJmZmFiNzQtMDJiYS00ZTgzLTljZGMtNjEzNzM4NmEyYjNiXkEyXkFqcGdeQXVyNjE5MjUyOTM@._V1_.jpg",
        ratings: "4.7"),
    Series(
        title: "Hello Ladies",
        year: "2013",
        type: .fantasy,
        image: "https://m.media-amazon.com/images/M/MV5BNjYxMjI3MzY3NF5BMl5BanBnXkFtZTgwMTgyNzg3MDE@._V1_.jpg",
        ratings: "4.3"),
    Series(
        title: "Kylie Cantrall",
        year: "2019",
        type: .mystery,
        image: "https://m.media-amazon.com/images/M/MV5BMDY4OTIwMTgtZTE1OC00ZjUwLWJhNzMtOWMxOGZiZGRiZmNiXkEyXkFqcGdeQXVyODIxOTM4MTk@._V1_.jpg",
        ratings: "4.1"),
    Series(
        title: "Hello",
        year: "2017",
        type: .romance,
        image: "https://m.media-amazon.com/images/M/MV5BOWM4ZmJhMTctZWI3NC00ODJiLWI1MGUtYjM3NTVmYzY0OTFlXkEyXkFqcGdeQXVyMTEzNzg0Mjkx._V1_.jpg",
        ratings: "4.7"),
   
    ]
#endif



    
