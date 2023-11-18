//
//  WhereIsDataAlertViewModel.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 17.11.2023.
//

import SwiftUI

class WhereIsDataAlertViewModel: ObservableObject {
    
    @Published var whereIsDataAlertModel: WhereIsDataAlertModel
    
    @Binding var isPresentingWhereAlert: Bool
    
    init(isPresentingWhereAlert: Binding<Bool>) {
        self._isPresentingWhereAlert = isPresentingWhereAlert
        self.whereIsDataAlertModel = WhereIsDataAlertModel(
            title: "Пc,",
            message: "их можно найти по кнопкам “Забыли логин/пароль”, но все равно никому их не сообщайте, это не безопасно",
            buttonText: "Хорошо"
        )
    }
    
    func cancel() {
        isPresentingWhereAlert.toggle()
    }
}
