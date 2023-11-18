//
//  TextView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 12.11.2023.
//

import SwiftUI

struct RegularText: View {
    var text: String
    var color: Color
    var size: CGFloat
    
    var body: some View {
        Text(text)
            .font(.custom("TildaSans-Regular", size: size))
            .foregroundStyle(Color(color))
    }
}

#Preview {
    RegularText(text: "Hey :)", color: .black, size: 15)
}
