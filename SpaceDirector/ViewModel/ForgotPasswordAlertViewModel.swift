//
//  ForgotPasswordAlertViewModel.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 17.11.2023.
//

import SwiftUI

class ForgotPasswordAlertViewModel: ObservableObject {
    @Published var forgotPasswordAlertModel: ForgotPasswordAlertModel
    
    @Binding var isPresentingPasswordAlert: Bool
    @Binding var password: String
    
    init(isPresentingPasswordAlert: Binding<Bool>, password: Binding<String>) {
        self._isPresentingPasswordAlert = isPresentingPasswordAlert
        self._password = password
        self.forgotPasswordAlertModel = ForgotPasswordAlertModel(
            title: "Забыли пароль?",
            message: "Ваш пароль: 12345678. Можете ввести вручную или нажать на кнопку ниже и он окажется в текстовом поле :)",
            buttonText: "Вставить"
        )
    }
    
    func insertPassword() {
        password = "12345678"
        isPresentingPasswordAlert.toggle()
    }
    
    func cancel() {
        isPresentingPasswordAlert.toggle()
    }
}
