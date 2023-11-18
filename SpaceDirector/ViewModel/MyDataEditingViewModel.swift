//
//  MyDataEditingViewModel.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 18.11.2023.
//

import SwiftUI

class MyDataEditingViewModel: ObservableObject {
    @Published var myName: String
    @Published var myAge: String
    @Published var myExperience: String
    @Published var myPost: String
    @Published var photoIsToggleOn: Bool

    init(userManager: UserManager) {
        self.myName = userManager.currentUser.name
        self.myAge = userManager.currentUser.age
        self.myExperience = userManager.currentUser.experience
        self.myPost = userManager.currentUser.post
        self.photoIsToggleOn = userManager.currentUser.photoIsToggleOn
    }

    func saveChanges() {
        UserManager.shared.updateCurrentUser(name: myName, 
                                             age: myAge,
                                             experience: myExperience,
                                             post: myPost)
    }
}
