//
//  SpaceDirectorApp.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 12.11.2023.
//

import SwiftUI

@main
struct SpaceDirectorApp: App {
    @AppStorage("isUserAuthenticated") var isUserAuthenticated = false
    @StateObject private var contactData = ContactData()
    
    var body: some Scene {
        WindowGroup {
            if isUserAuthenticated {
                HomeView(viewModel: NASAViewModel())
                    .environmentObject(ContactData())
            } else {
               HelloView()
                    .environmentObject(ContactData())
            }
        }
    }
}
