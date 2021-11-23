//
//  HomeViewModel.swift
//  RKMovieDBUI
//  Sample MVVM architecture ViewModel
//  Created by Rathakrishnan on 19/11/21.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    
    var genres = [Genre]()
    var nowShowing = [NowShowing]()
    var movies = [Movie]()

    static var mainUrl = "https://raw.githubusercontent.com/RathaKrishna/MovieData/main/"
    
    enum EndApis: String {
        case genresApi = "genres.json"
        case nowShowingApi = "nowShowing.json"
        case moviesApi = "movies.json"
        
        var url: String {
            return HomeViewModel.mainUrl + self.rawValue
            
        }
    }
    
    init() {
        getHomeData()
    }
   
    private func getHomeData() {
        //Create Object for DispatchGroup
        let dispatchGroup = DispatchGroup()
        //Enter First Task
        dispatchGroup.enter()
        
        // Call first task
        getData(EndApis.genresApi.url, [Genre].self) { data in
            self.genres = data
            
            //After get data, leve the group
            dispatchGroup.leave()
        }
        
        //Second task
        dispatchGroup.enter()
        
        //call second data
        getData(EndApis.nowShowingApi.url, [NowShowing].self) { data in
            self.nowShowing = data
            //leave group
            dispatchGroup.leave()
        }
        
        //Third task
        dispatchGroup.enter()
        
        //call movies json
        getData(EndApis.moviesApi.url, [Movie].self) { data in
            self.movies = data
            // leave group
            dispatchGroup.leave()
        }
        
        //Notify main thred
        dispatchGroup.notify(queue: .main) {
            self.isLoading = true
        }
    }
    
    private func getData<DataKind: Codable>(_ url: String, _ dataKind: DataKind.Type, _ completion: @escaping (_ data: DataKind)->Void) {
        let url = URL(string: url)
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if error == nil && data != nil {
                let convertedData = try! JSONDecoder().decode(dataKind, from: data!)
                completion(convertedData)
            }
        }.resume()
    }
}
