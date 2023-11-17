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

    var currentUser: UserProfile {
        get {
            if let savedData = userDefaults.object(forKey: userKey) as? Data,
               let decodedUser = try? JSONDecoder().decode(UserProfile.self, from: savedData) {
                return decodedUser
            } else {
                return UserProfile(name: "", age: "25", experience: "6", post: "Астрофизик", photoIsToggleOn: true, email: "thebest@email.com", password: "12345678")
            }
        }
        set {
            if let encodedData = try? JSONEncoder().encode(newValue) {
                userDefaults.set(encodedData, forKey: userKey)
            }
        }
    }
    func updateCurrentUser(name: String, age: String, experience: String, post: String) {
        currentUser.name = name
        currentUser.age = age
        currentUser.experience = experience
        currentUser.post = post
        }
}

struct UserProfile: Codable {
    var name: String
    var age: String
    var experience: String
    var post: String
    var photoIsToggleOn: Bool
    var email: String
    var password: String
}
