//
//  ForgotPasswordAlertViewModel.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 17.11.2023.
//

import SwiftUI

class ForgotPasswordAlertViewModel: ObservableObject {
    
    @Published var forgotPasswordAlertModel: ForgotPasswordAlertModel
    @StateObject private var userManager = UserManager.shared
    
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
        password = userManager.currentUser.password
        isPresentingPasswordAlert.toggle()
    }
    
    func cancel() {
        isPresentingPasswordAlert.toggle()
    }
}
