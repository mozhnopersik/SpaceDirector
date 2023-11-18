//
//  PasswordView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 14.11.2023.
//

import SwiftUI

struct ForgotPasswordAlertView: View {
    @ObservedObject var forgotPasswordAlertViewModel: ForgotPasswordAlertViewModel

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
                    RegularText(text: forgotPasswordAlertViewModel.forgotPasswordAlertModel.title, color: Color("Barb"), size: 15)
                    RegularText(text: forgotPasswordAlertViewModel.forgotPasswordAlertModel.message, color: Color("Barb"), size: 15)
                        .padding(.horizontal, 60)
                        .multilineTextAlignment(.center)
                }
                
                HStack (spacing: 77) {
                    Button(action: {
                        forgotPasswordAlertViewModel.insertPassword()
                    }) {
                        RegularText(text: "Вставить", color: Color("Barb"), size: 15)
                    }
                    
                    Button(action: {
                        forgotPasswordAlertViewModel.cancel()
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
    ForgotPasswordAlertView(forgotPasswordAlertViewModel: ForgotPasswordAlertViewModel(isPresentingPasswordAlert: .constant(true), password: .constant("")))
}
