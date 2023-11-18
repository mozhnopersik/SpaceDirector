//
//  NewContactView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 16.11.2023.
//

import SwiftUI

struct NewContactView: View {
    
    @EnvironmentObject private var contactData: NewContactViewModel
    @State private var name = ""
    @State private var surname = ""
    @State private var number = ""
    @Binding var newContactIsPresented: Bool
    
    var body: some View {
        ZStack {
            Image("BackgroundTwo")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack (alignment: .leading) {
                HStack (alignment: .top) {
                    RegularText(text: "Тут можно добавить новый контакт", 
                                color: .white,
                                size: 25)
                        .padding(.bottom, 20)
                        .padding(.trailing, 30)
                    Spacer()
                    Button(action: {
                        newContactIsPresented.toggle()
                    }) {
                        RegularText(text: "назад", color: .white, size: 15)
                            .padding(.top, 8)
                    }
                }
                RegularText(text: "Имя:", 
                            color: .white, 
                            size: 15)
                WhiteTextField(text: $name, placeholder: "")
                    .padding(.bottom, 10)
                RegularText(text: "Фамилия:", 
                            color: .white,
                            size: 15)
                WhiteTextField(text: $surname, placeholder: "")
                    .padding(.bottom, 10)
                RegularText(text: "Номер телефона:", 
                            color: .white,
                            size: 15)
                WhiteTextField(text: $number, placeholder: "")
                    .keyboardType(.numberPad)
                    .padding(.bottom, 10)
                Spacer()
                HStack {
                    Spacer()
                    BarbButton(title: "Сохранить", action: {
                        let newContact = NewContactViewModel.Contact(name: name, 
                                                                     surname: surname,
                                                                     number: number)
                        contactData.contacts.append(newContact)

                        newContactIsPresented.toggle()
                    }, width: 147, height: 47)
                    Spacer()
                }
                .padding(.bottom, 60)
            }
            .padding(.horizontal, 35)
            .padding(.top, 100)
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), 
                   to: nil,
                   from: nil,
                   for: nil)
    }
}

#Preview {
    NewContactView(newContactIsPresented: .constant(true))
}
