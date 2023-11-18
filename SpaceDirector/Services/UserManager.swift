//
//  UserManager.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 16.11.2023.
//

import Foundation

class UserManager: ObservableObject {
    
    static let shared = UserManager()
    
    private let userDefaults = UserDefaults.standard
    private let userKey = "UserKey"
    
    @Published var currentUser: UserProfile {
        didSet {
            objectWillChange.send()
        }
    }
    
    init() {
        if let savedData = userDefaults.object(forKey: userKey) as? Data,
           let decodedUser = try? JSONDecoder().decode(UserProfile.self, from: savedData) {
            self.currentUser = decodedUser
        } else {
            self.currentUser = UserProfile(name: "", age: "25", experience: "6", post: "Астрофизик", photoIsToggleOn: true, email: "thebest@email.com", password: "12345678")
        }
    }
    
    func updateCurrentUser(name: String, age: String, experience: String, post: String) {
        currentUser.name = name
        currentUser.age = age
        currentUser.experience = experience
        currentUser.post = post
        saveCurrentUser()
    }
    
    private func saveCurrentUser() {
        if let encodedData = try? JSONEncoder().encode(currentUser) {
            userDefaults.set(encodedData, forKey: userKey)
        }
    }
}
