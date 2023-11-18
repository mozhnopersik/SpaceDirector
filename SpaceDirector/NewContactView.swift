//
//  NewContactView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 16.11.2023.
//

import SwiftUI

struct NewContactView: View {
    @EnvironmentObject private var contactData: ContactData
    @State private var name: String
    @State private var surname: String
    @State private var number: String
    @Binding var newContactIsPresented: Bool

    init(name: String, surname: String, number: String, newContactIsPresented: Binding<Bool>) {
        self._name = State(initialValue: name)
        self._surname = State(initialValue: surname)
        self._number = State(initialValue: number)
        self._newContactIsPresented = newContactIsPresented
    }
    
    var body: some View {
        ZStack {
            Image("BackgroundTwo")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack (alignment: .leading) {
                HStack (alignment: .top) {
                    RegularText(text: "Тут можно добавить новый контакт", color: .white, size: 25)
                        .padding(.bottom, 20)
                        .padding(.trailing, 30)
                    Spacer()
                    Button(action: {
                        newContactIsPresented.toggle()
                        print("g")
                    }) {
                        RegularText(text: "назад", color: .white, size: 15)
                            .padding(.top, 8)
                    }
                }
                
                RegularText(text: "Имя:", color: .white, size: 15)
                WhiteTextField(text: $name, placeholder: "")
                    .padding(.bottom, 10)
                RegularText(text: "Фамилия:", color: .white, size: 15)
                WhiteTextField(text: $surname, placeholder: "")
                    .padding(.bottom, 10)
                RegularText(text: "Номер телефона:", color: .white, size: 15)
                WhiteTextField(text: $number, placeholder: "")
                    .keyboardType(.numberPad)
                    .padding(.bottom, 10)
                
                Spacer()
                HStack {
                    Spacer()
                    BarbButton(title: "Сохранить", action: {
                        let newContact = ContactData.Contact(name: name, surname: surname, number: number)
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
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

class ContactData: ObservableObject {
    @Published var contacts: [Contact] = [] {
        didSet {
            saveContacts()
        }
        
    }
    
    struct Contact: Hashable, Codable {
        var name: String
        var surname: String
        var number: String
    }
    
    init() {
        loadContacts()
    }
    
    private func saveContacts() {
        if let encodedData = try? JSONEncoder().encode(contacts) {
            UserDefaults.standard.set(encodedData, forKey: "contactsKey")
        }
    }
    
    private func loadContacts() {
        if let savedData = UserDefaults.standard.data(forKey: "contactsKey"),
           let decodedContacts = try? JSONDecoder().decode([Contact].self, from: savedData) {
            contacts = decodedContacts
        }
    }
}

//#Preview {
//    NewContactView(name: "", surname: "", number: "", newContactIsPresented: .constant(true))
//        .environmentObject(ContactData())
//}
