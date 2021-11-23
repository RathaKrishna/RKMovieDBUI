//
//  PageView.swift
//  TodoSwiftUI
//
//  Created by Rathakrishnan on 18/03/21.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: [
            PageCardView(image: "https://m.media-amazon.com/images/M/MV5BMTg0NTM3MTI1MF5BMl5BanBnXkFtZTgwMTAzNTAzNzE@._V1_.jpg", title: "Title") ,
            PageCardView(image: "https://m.media-amazon.com/images/M/MV5BZGFmZjQ0ZTYtNjNkOC00OTAxLTlmMWMtNThmMWRkMTcyODY0XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg", title: "Title") ,
        ])
        .aspectRatio(3 / 2, contentMode: .fit)
    }
}
