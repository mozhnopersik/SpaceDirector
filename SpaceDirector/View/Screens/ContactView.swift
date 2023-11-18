//
//  ContactView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 16.11.2023.
//

import SwiftUI

struct ContactView: View {
    
    @EnvironmentObject private var contactData: NewContactViewModel
    @Environment(\.dismiss) private var dismiss
    var contact: NewContactViewModel.Contact
    
    var body: some View {
        ZStack {
            Image("BackgroundTwo")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack (alignment: .leading, spacing: 10) {
                HStack {
                    RegularText(text: "\(contact.name) \(contact.surname)", 
                                color: .white,
                                size: 30)
                    Spacer()
                    Button(action: {
                        dismiss()
                    }) {
                        RegularText(text: "назад", 
                                    color: .white,
                                    size: 15)
                    }
                }
                RegularText(text: "Номер телефона: \(contact.number)", 
                            color: .white,
                            size: 15)
                Spacer()
                HStack {
                    Spacer()
                    BarbButton(title: "Удалить контакт", 
                               action: { removeContact() },
                               width: 147,
                               height: 47)
                    Spacer()
                }
                .padding(.bottom, 60)
                
            }
            .padding(.horizontal, 31)
            .padding(.top, 80)
        }
        .toolbar(.hidden)
    }
    
    private func removeContact() {
        if let index = contactData.contacts.firstIndex(of: contact) {
            contactData.contacts.remove(at: index)
        }
        dismiss()
    }
}

#Preview {
    ContactView(contact: NewContactViewModel.Contact(name: "John", surname: "Karter", number: "89610568807"))
}
