//
//  ContactsView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 14.11.2023.
//

import SwiftUI

struct ContactsView: View {
    
    @EnvironmentObject private var contactData: ContactData
    @State private var newContactIsPresented = false
    
    var body: some View {
        ZStack {
            Image("BackgroundTwo")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack (alignment: .leading, spacing: 10) {
                RegularText(text: "Это ваши контакты", color: .white, size: 30)
                RegularText(text: "Вы можете добавить сюда ваших коллег, или каких-нибудь знаменитостей.", color: .white, size: 15)
                GeometryReader { geometry in
                    VStack {
                        List {
                            ContactCellView(name: "Тим", surname: "Кук", width: geometry.size.width - 22, contact: ContactData.Contact(name: "", surname: "", number: ""))
                                .listRowBackground(Color.clear)
                                .listRowSeparator(.hidden)
                            ContactCellView(name: "Тим", surname: "Кук", width: geometry.size.width - 22, contact: ContactData.Contact(name: "", surname: "", number: ""))
                                .listRowBackground(Color.clear)
                                .listRowSeparator(.hidden)
                            ForEach(contactData.contacts, id: \.self) { contact in
                                ContactCellView(name: contact.name, surname: contact.surname, width: geometry.size.width - 22, contact: contact)
                                    .listRowBackground(Color.clear)
                                    .listRowSeparator(.hidden)
                                    
                            }
                        }
                        .listStyle(PlainListStyle())
                        .foregroundColor(.clear)
                        Spacer()
                        BarbButtonView(title: "Добавить новый контакт", action: {
                            newContactIsPresented.toggle()
                            print(newContactIsPresented)
                        }, width: 240, height: 47)
                        .padding(.bottom, 120)
                        
                    }
                }
                .sheet(isPresented: $newContactIsPresented) {
                    NewContactView(name: "", surname: "", number: "", newContactIsPresented: $newContactIsPresented)
                }
            }
            .padding(.horizontal, 32)
            .padding(.top, 100)
        }
    }
}


#Preview {
    ContactsView()
        .environmentObject(ContactData())
}
