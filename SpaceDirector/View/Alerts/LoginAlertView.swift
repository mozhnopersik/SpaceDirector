//
//  LoginView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 13.11.2023.
//

import SwiftUI

struct LoginAlertView: View {
    @Binding var isPresentingLoginAlert: Bool
    @Binding var email: String

    var action: () -> Void
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 22.0)
                .frame(width: 290, height: 140)
                .foregroundColor(.white)
            HorizontalLineView(width: 290)
                .padding(.top, 60)
            VerticalLineView(height: 40)
                .padding(.top, 100)
                .padding(.trailing, 7)
            VStack (spacing: 23) {
                VStack (spacing: 4) {
                    RegularText(text: "Забыли логин?", color: Color("Barb"), size: 15)
                    RegularText(text: "Ваш логин: thebest@email.com. Можете ввести вручную или нажать на кнопку ниже и он окажется в текстовом поле :)", color: Color("Barb"), size: 15)
                        .padding(.horizontal, 60)
                        .multilineTextAlignment(.center)
                }
                
                HStack (spacing: 77) {
                    Button(action: {
                        email = "thebest@email.com"
                        isPresentingLoginAlert.toggle()
                    }) {
                        RegularText(text: "Вставить", color: Color("Barb"), size: 15)
                    }
                    
                    Button(action: {
                        isPresentingLoginAlert.toggle()
                    }) {
                        RegularText(text: "Не нужно", color: Color("Barb"), size: 15)
                    }
                }
            }
        }
        .background(Color.clear)
    }
}
struct VerticalLineView: View {
    var height: CGFloat
    var body: some View {
        Rectangle()
            .frame(width: 0.6, height: height)
            .foregroundColor(Color("Barb"))
    }
}
#Preview {
    LoginAlertView(isPresentingLoginAlert: .constant(true), email: .constant(""), action: {print("")})
}
