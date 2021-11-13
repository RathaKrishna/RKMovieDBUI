//
//  NoDataView.swift
//  RkMovieUI
//
//  Created by Rathakrishnan on 11/11/21.
//

import SwiftUI

struct NoDataView: View {
    var body: some View {
        VStack {
            Image("empty_img")
                .resizable()
                .scaledToFit()
            
        }
    }
}

struct NoDataView_Previews: PreviewProvider {
    static var previews: some View {
        NoDataView()
    }
}
