//
//  ContactCellView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 14.11.2023.
//

import SwiftUI

struct ContactCellView: View {
    
    @EnvironmentObject private var contactData: NewContactViewModel
    
    var name: String
    var surname: String
    var width: CGFloat
    var contact: NewContactViewModel.Contact
    
    var body: some View {
        NavigationLink(destination: ContactView(contact: contact)) {
            ZStack {
//            Color.black
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(.white)
                    .frame(width: width, height: 53)
                    .padding(0)
                HStack {
                    RegularText(text: "\(name) \(surname)", 
                                color: Color("Barb"),
                                size: 15)
                        .padding(.leading, 35)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ContactCellView(name: "Тим Кук", 
                    surname: "",
                    width: 330,
                    contact: NewContactViewModel.Contact(name: "",
                                                         surname: "",
                                                         number: ""))
}
