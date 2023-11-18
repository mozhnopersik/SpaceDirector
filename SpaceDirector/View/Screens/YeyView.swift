//
//  YeyView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 14.11.2023.
//

import SwiftUI

struct YeyView: View {
    
    @State private var isLoading = false
    
    @AppStorage("isUserAuthenticated") var isUserAuthenticated: Bool?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("BackgroundTwo")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack (spacing: 10) {
                    RegularText(text: "Ура", 
                                color: .white,
                                size: 30)
                    RegularText(text: "А вот и ваш личный кабинет",
                                color: .white,
                                size: 30)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                    BarbButton(title: "Ну ка", 
                               action: {
                        isLoading = true
                        isUserAuthenticated = true
                        isLoading = false },
                               width: 147,
                               height: 47
                    )
                    .padding(.top)
                    .overlay(
                        Group {
                            if isLoading {
                                ProgressView()
                            }
                        })
                }
            }
            .toolbar(.hidden)
        }
    }
}

#Preview {
    YeyView()
}
