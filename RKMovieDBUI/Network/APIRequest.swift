//
//  APIRequest.swift
//  RKMovieDBUI
//
//  Created by Rathakrishnan on 25/11/21.
//

import Foundation

class APIRequest {
    
    let url: String
    
    init(url: String)  {
        self.url = url
        
    }
    
     func getData<DataKind: Codable>( _ dataKind: DataKind.Type, _ completion: @escaping (_ data: DataKind)->Void) {
        let url = URL(string: self.url)
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if error == nil && data != nil {
                let convertedData = try! JSONDecoder().decode(dataKind, from: data!)
                completion(convertedData)
            }
        }.resume()
    }
    
    
}
