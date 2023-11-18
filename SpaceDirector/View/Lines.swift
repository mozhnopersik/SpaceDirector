//
//  Lines.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 17.11.2023.
//

import SwiftUI

struct Lines: View {
    var body: some View {
        Text("Place a View here to view it :)")
    }
}

struct VerticalLine: View {
    var height: CGFloat
    
    var body: some View {
        Rectangle()
            .frame(width: 0.6, height: height)
            .foregroundColor(Color("Barb"))
    }
}

struct HorizontalLine: View {
    var width: CGFloat
    
    var body: some View {
        Rectangle()
            .frame(width: width, height: 0.6)
            .foregroundColor(Color("Barb"))
    }
}

#Preview {
    Lines()
}
