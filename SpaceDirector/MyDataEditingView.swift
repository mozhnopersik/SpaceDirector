//
//  NewContactView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 14.11.2023.
//

import SwiftUI

struct MyDataEditingView: View {
    @State private var name: String
    @State private var age: String
    @State private var experience: String
    @State private var post: String
    
    @State private var isToggleOn: Bool
    @Binding var newContactIsPresented: Bool
    
    public init(name: String, age: String, experience: String, post: String, isToggleOn: Bool, newContactIsPresented: Binding<Bool>) {
        self._name = State(initialValue: "name")
        self._age = State(initialValue: "age")
        self._experience = State(initialValue: "experience")
        self._post = State(initialValue: "post")
        self._isToggleOn = State(initialValue: true)
        self._newContactIsPresented = newContactIsPresented
    }
    
    var body: some View {
        ZStack {
            Image("BackgroundTwo")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack (alignment: .leading) {
                RegularTextView(text: "Тут можно изменить данные", color: .white, size: 25)
                    .padding(.bottom, 20)
                    .padding(.trailing, 30)
                
                RegularTextView(text: "Ваше имя:", color: .white, size: 15)
                TextFieldView(state: $name, placeholder: "")
                    .padding(.bottom, 10)
                RegularTextView(text: "Ваш возраст:", color: .white, size: 15)
                TextFieldView(state: $age, placeholder: "")
                    .padding(.bottom, 10)
                
                RegularTextView(text: "Ваш стаж:", color: .white, size: 15)
                TextFieldView(state: $name, placeholder: "")
                    .padding(.bottom, 10)
                RegularTextView(text: "Ваша должность:", color: .white, size: 15)
                TextFieldView(state: $age, placeholder: "")
                    .padding(.bottom, 10)
                Toggle(isOn: $isToggleOn, label: {
                    RegularTextView(text: "А тут можно сменить фото на мужское (пока так)", color: .white, size: 15)
                })
                
                Spacer()
                HStack {
                    Spacer()
                    BarbButtonView(title: "Сохранить", action: { newContactIsPresented.toggle() }, width: 147, height: 47)
                    Spacer()
                }
                .padding(.bottom, 60)
            }
            .padding(.horizontal, 35)
            .padding(.top, 100)
            
        }
    }
}
//
//#Preview {
//    NewContactView(email: "sakuraiswinx@mail.ru", password: "123")
//}
