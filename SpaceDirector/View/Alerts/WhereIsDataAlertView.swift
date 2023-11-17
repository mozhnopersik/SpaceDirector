//
//  CustomAlertView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 13.11.2023.
//

import SwiftUI

struct WhereIsDataAlertView: View {
    @Binding var isPresentingWhereAlert: Bool
    
    var action: () -> Void
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 22.0)
                .frame(width: 290, height: 140)
                .foregroundColor(.white)
            HorizontalLineView(width: 290)
                .padding(.top, 60)
            VStack (spacing: 23) {
                VStack (spacing: 3) {
                    RegularText(text: "Пc,", color: Color("Barb"), size: 15)
                    RegularText(text: "их можно найти по кнопкам “Забыли логин/пароль”, но все равно никому их не сообщайте, это не безопасно", color: Color("Barb"), size: 15)
                        .padding(.horizontal, 60)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 3)
                Button(action: {
                    isPresentingWhereAlert.toggle()
                }) {
                    RegularText(text: "Хорошо", color: Color("Barb"), size: 15)
                }
                .padding(.top, 0)
            }
            
        }
        .background(Color.clear)
    }
}

struct HorizontalLineView: View {
    var width: CGFloat
    var body: some View {
        Rectangle()
            .frame(width: width, height: 0.6)
            .foregroundColor(Color("Barb"))
    }
}

#Preview {
    WhereIsDataAlertView(isPresentingWhereAlert: .constant(true), action: {print("")})
}
