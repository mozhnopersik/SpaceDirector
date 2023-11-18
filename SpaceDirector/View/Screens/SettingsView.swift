//
//  SettingsView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 15.11.2023.
//

import SwiftUI

struct SettingsView: View {
    @State private var isEnglishOn = false
    @State private var isDarkThemeOn = false
    
    var body: some View {
        ZStack {
            Image("BackgroundTwo")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack (alignment: .leading) {
                RegularText(text: "Ну и тут немного фичей", color: .white, size: 30)
                GrayRoundedRectangle()
                Toggle(isOn: $isEnglishOn, label: {
                    RegularText(text: "Например, можно сменить язык на английский и обратно", color: .white, size: 15)
                })
                .padding(.horizontal, 2)
                Toggle(isOn:$isDarkThemeOn, label: {
                    RegularText(text: "И сменить тему на темную и обратно", color: .white, size: 15)
                })
                .padding(.horizontal, 2)
                
                Spacer()
            }
            .padding(.horizontal, 30)
            .padding(.top, 100)
        }
    }
}

struct GrayRoundedRectangle: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 350, height: 100)
                .opacity(0.3)
            RegularText(text: "Это запланированные плюшки этого приложения, скоро я их реализую и можно будет попробовать :)", color: .white, size: 15)
                .padding(.horizontal, 17)
        }
    }
}

#Preview {
    SettingsView()
}
