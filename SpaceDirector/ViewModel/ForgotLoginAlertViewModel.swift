//
//  ForgotLoginAlertViewModel.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 17.11.2023.
//

import SwiftUI

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
