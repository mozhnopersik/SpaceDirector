//
//  PasswordView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 14.11.2023.
//

import SwiftUI

struct PasswordAlertView: View {
    
    @Binding var isPresentingPasswordAlert: Bool
    @Binding var password: String
    
    var action: () -> Void
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 22.0)
                .frame(width: 290, height: 140)
                .foregroundColor(.white)
            HorizontalLine(width: 290)
                .padding(.top, 60)
            VerticalLine(height: 40)
                .padding(.top, 100)
                .padding(.trailing, 7)
            VStack (spacing: 23) {
                VStack (spacing: 4) {
                    RegularText(text: "Забыли пароль?", color: Color("Barb"), size: 15)
                    RegularText(text: "Ваш пароль: 12345678. Можете ввести вручную или нажать на кнопку ниже и он окажется в текстовом поле :)", color: Color("Barb"), size: 15)
                        .padding(.horizontal, 60)
                        .multilineTextAlignment(.center)
                }
                
                HStack (spacing: 77) {
                    Button(action: {
                        password = "12345678"
                        isPresentingPasswordAlert.toggle()
                    }) {
                        RegularText(text: "Вставить", color: Color("Barb"), size: 15)
                    }
                    
                    Button(action: {
                        isPresentingPasswordAlert.toggle()
                    }) {
                        RegularText(text: "Не нужно", color: Color("Barb"), size: 15)
                    }
                }
            }
        }
        .background(Color.clear)
    }
}

#Preview {
    PasswordAlertView(isPresentingPasswordAlert: .constant(true), password: .constant(""), action: {print("")})
}
