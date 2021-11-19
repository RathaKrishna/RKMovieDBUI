//
//  Helpers.swift
//  RKMovieDBUI
//
//  Created by Rathakrishnan on 19/11/21.
//

import Foundation

struct Helpers {
    
    init() {
        
    }
    func calculateTime(runTime: String) -> String {
        let dRunTime = (runTime as NSString).doubleValue
        let toSeconds = dRunTime * 60.0
        let result = toSeconds.asString(style: .abbreviated)
        return result
    }
}
