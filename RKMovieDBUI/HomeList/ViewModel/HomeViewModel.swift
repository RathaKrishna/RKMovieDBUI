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
        
        let genresReq = APIRequest.init(url: EndApis.genresApi.url)
        genresReq.getData([Genre].self) { data in
            self.genres = data
            
            //After get data, leve the group
            dispatchGroup.leave()
        }
        
        //Second task
        dispatchGroup.enter()
        
        //call second data
        let nowShowingReq = APIRequest.init(url: EndApis.nowShowingApi.url)
        nowShowingReq.getData( [NowShowing].self) { data in
            self.nowShowing = data
            //leave group
            dispatchGroup.leave()
        }
        
        //Third task
        dispatchGroup.enter()
        
        //call movies json
        let movieReq = APIRequest.init(url: EndApis.moviesApi.url)
        movieReq.getData([Movie].self) { data in
            self.movies = data
            // leave group
            dispatchGroup.leave()
        }

        
        //Notify main thred
        dispatchGroup.notify(queue: .main) {
            self.isLoading = true
        }
    }
    
   
}
