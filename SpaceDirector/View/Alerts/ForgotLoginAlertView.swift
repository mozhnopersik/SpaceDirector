//
//  LoginView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 13.11.2023.
//

import SwiftUI

struct ForgotLoginAlertModel {
    var title: String
    var message: String
    var buttonText: String
}

class ForgotLoginAlertViewModel: ObservableObject {
    @Published var forgotLoginAlertModel: ForgotLoginAlertModel
    
    @Binding var isPresentingLoginAlert: Bool
    @Binding var email: String
    
    init(isPresentingLoginAlert: Binding<Bool>, email: Binding<String>) {
        self._isPresentingLoginAlert = isPresentingLoginAlert
        self._email = email
        self.forgotLoginAlertModel = ForgotLoginAlertModel(
            title: "Забыли логин?",
            message: "Ваш логин: thebest@email.com. Можете ввести вручную или нажать на кнопку ниже и он окажется в текстовом поле :)",
            buttonText: "Вставить"
        )
    }
    
    func insertEmail() {
        email = "thebest@email.com"
        isPresentingLoginAlert.toggle()
    }
    
    func cancel() {
        isPresentingLoginAlert.toggle()
    }
}

struct ForgotLoginAlertView: View {
    @ObservedObject var forgotLoginAlertViewModel: ForgotLoginAlertViewModel
    
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
                    RegularText(text: forgotLoginAlertViewModel.forgotLoginAlertModel.title, color: Color("Barb"), size: 15)
                    RegularText(text: forgotLoginAlertViewModel.forgotLoginAlertModel.message, color: Color("Barb"), size: 15)
                        .padding(.horizontal, 60)
                        .multilineTextAlignment(.center)
                }
                
                HStack (spacing: 77) {
                    Button(action: {
                        forgotLoginAlertViewModel.insertEmail()
                    }) {
                        RegularText(text: "Вставить", color: Color("Barb"), size: 15)
                    }
                    
                    Button(action: {
                        forgotLoginAlertViewModel.cancel()
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
    ForgotLoginAlertView(forgotLoginAlertViewModel: ForgotLoginAlertViewModel(isPresentingLoginAlert: .constant(true), email: .constant("")))
}
