//
//  Styles.swift
//  RKMovieDBUI
//
//  Created by Rathakrishnan on 17/11/21.
//

import SwiftUI

struct FavoriteButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.clear)
            .cornerRadius(15.0)
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
    }
}

struct GradientButtonStyle: ButtonStyle {
    
    
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color.btnBgColor, Color.lightRed]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(15.0)
    }
}

struct BlackButtonStyle: ButtonStyle {
    var isSelected: Bool
    var nGradient = LinearGradient(gradient: Gradient(colors: [Color.btnBgColor, Color.lightRed]), startPoint: .leading, endPoint: .trailing)
    var sGradient = LinearGradient(gradient: Gradient(colors: [Color.btnBlack, Color(.systemGray)]), startPoint: .leading, endPoint: .trailing)
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .background(isSelected ? sGradient : nGradient)
            .cornerRadius(10.0)
    }
}
