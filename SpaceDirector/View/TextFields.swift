//
//  TextFields.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 17.11.2023.
//

import SwiftUI

struct TextFields: View {
    var body: some View {
        Text("Place a View here to view it :)")
    }
}

struct WhiteTextField: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .font(.system(size: 12))
            .foregroundColor(.white)
            .frame(height: 44)
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: 36)
                    .stroke(Color.white, lineWidth: 0.5)
            )
    }
}

struct PasswordTextField: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        SecureField(placeholder, text: $text)
            .font(.system(size: 12))
            .foregroundColor(.white)
            .frame(height: 44)
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: 36)
                    .stroke(Color.white, lineWidth: 0.5)
            )
    }
}

#Preview {
    TextFields()
}
