//
//  String+Ext.swift
//  RKMovieDBUI
//
//  Created by Rathakrishnan on 25/11/21.
//

import Foundation

extension String {
    var calculatedTime: String {
        let dRunTime = (self as NSString).doubleValue
        let toSeconds = dRunTime * 60.0
        let result = toSeconds.asString(style: .abbreviated)
        return result
    }
}
