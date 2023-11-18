//
//  NewContactViewModel.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 18.11.2023.
//

import SwiftUI

class NewContactViewModel: ObservableObject {
    
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
