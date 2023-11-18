//
//  ButtonsView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 13.11.2023.
//

import SwiftUI

struct Buttons: View {
    var body: some View {
        Text("Place a View here to view it :)")
    }
}

struct BarbButton: View {
    var title: String
    var action: () -> Void
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        Button(action: action) {
            RoundedRectangle(cornerRadius: 27)
                .foregroundColor(Color("Barb"))
                .frame(width: width, height: height)
                .overlay(
                    Text(title)
                        .font(.custom("TildaSans-Regular", size: 15))
                        .foregroundColor(Color.white)
                )
        }
    }
}

struct BarbRoudedButton: View {
    var title: String
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: 27)
            .foregroundColor(Color("Barb"))
            .frame(width: width, height: height)
            .overlay(
                Text(title)
                    .font(.custom("TildaSans-Regular", size: 15))
                    .foregroundColor(Color.white)
            )
    }
}

#Preview {
    Buttons()
}
