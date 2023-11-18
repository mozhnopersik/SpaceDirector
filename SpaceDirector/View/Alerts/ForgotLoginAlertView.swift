//
//  LoginView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 13.11.2023.
//

import SwiftUI

struct ForgotLoginAlertView: View {
    
    @ObservedObject var forgotLoginAlertViewModel: ForgotLoginAlertViewModel
    
    var body: some View {
        ZStack {
//            Color.black
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
                    RegularText(text: forgotLoginAlertViewModel.forgotLoginAlertModel.title, 
                                color: Color("Barb"),
                                size: 15)
                    RegularText(text: forgotLoginAlertViewModel.forgotLoginAlertModel.message, 
                                color: Color("Barb"),
                                size: 15)
                        .padding(.horizontal, 60)
                        .multilineTextAlignment(.center)
                }
                HStack (spacing: 77) {
                    Button(action: {
                        forgotLoginAlertViewModel.insertEmail()
                    }) {
                        RegularText(text: "Вставить", 
                                    color: Color("Barb"),
                                    size: 15)
                    }
                    Button(action: {
                        forgotLoginAlertViewModel.cancel()
                    }) {
                        RegularText(text: "Не нужно", 
                                    color: Color("Barb"),
                                    size: 15)
                    }
                }
            }
        }
    }
}

#Preview {
    ForgotLoginAlertView(forgotLoginAlertViewModel: ForgotLoginAlertViewModel(isPresentingLoginAlert: .constant(true), 
                                                                              email: .constant("")))
}
