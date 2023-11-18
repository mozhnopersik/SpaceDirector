//
//  ContactCellView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 14.11.2023.
//

import SwiftUI

struct ContactCellView: View {
    @EnvironmentObject private var contactData: ContactData
    
    var name: String
    var surname: String
    var width: CGFloat
    var contact: ContactData.Contact
    
    var body: some View {
        NavigationLink(destination: ContactView(contact: contact)) {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(.white)
                    .frame(width: width, height: 53)
                    .padding(0)
                HStack {
                    RegularText(text: "\(name) \(surname)", color: Color("Barb"), size: 15)
                        .padding(.leading, 35)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ContactCellView(name: "Тим Кук", surname: "", width: 330, contact: ContactData.Contact(name: "", surname: "", number: ""))
}
