//
//  ContentView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 12.11.2023.
//

import SwiftUI

struct HelloView: View {
    @State private var showText1 = false
    @State private var showText2 = false
    @State private var showText3 = false
    @State private var showText4 = false
    @State private var showText5 = false
    @State private var showText6 = false
    
    @State private var signInIsPresented = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                if showText1 || showText2 || showText3 {
                    Image("Background")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    
                    
                    if showText1 {
                        ZStack {
                            RegularText(text: "Привет", color: .white, size: 30)
                                .transition(.opacity.animation(.easeIn(duration: 1.0)))
                            RegularText(text: "tap  here :)", color: .white, size: 15)
                                .padding(.top, 300)
                                .transition(.opacity.animation(.easeIn(duration: 1.0)))
                        }
                    }
                    
                    if showText2 {
                        RegularText(text: "Меня зовут Рони", color: .white, size: 30)
                            .transition(.opacity.animation(.easeIn(duration: 1.0)))
                    }
                    
                    if showText3 {
                        RegularText(text: "И сейчас я постараюсь продемонстрировать вам часть технологий, которыми я владею", color: .white, size: 30)
                            .padding()
                            .transition(.opacity.animation(.easeIn(duration: 1.0)))
                            .multilineTextAlignment(.center)
                        
                        BarbButtonView(title: "Давай", action: {
                            showText4 = true
                            showText3 = false
                        }, width: 132, height: 47)
                        .padding(.top, 400)
                        .transition(.opacity.animation(.easeIn(duration: 1.0).delay(1.5)))
                    }
                    
                } else {
                    ZStack {
                        Image("BackgroundTwo")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                        VStack (alignment: .leading, spacing: 25) {
                            if showText4 {
                                RegularText(text: "Предлагаю представить, что вы студент-астрофизик из NASA", color: .white, size: 25)
                                    .transition(.opacity.animation(.easeIn(duration: 1.0)))
                                BarbButtonView(title: "Ну допустим", action: { showText5 = true }, width: 168, height: 47)
                                    .transition(.opacity.animation(.easeIn(duration: 1.0).delay(1.5)))
                            }
                            if showText5 {
                                RegularText(text: "И это ваш личный кабинет в приложении агенства", color: .white, size: 25)
                                    .transition(.opacity.animation(.easeIn(duration: 1.0)))
                                
                                BarbButtonView(title: "Так, и что теперь?", action: { showText6 = true }, width: 204, height: 47)
                                    .transition(.opacity.animation(.easeIn(duration: 1.0).delay(1.5)))
                            }
                            if showText6 {
                                RegularText(text: "Все-все, не томлю, заходите :)", color: .white, size: 25)
                                    .padding(.trailing)
                                    .transition(.opacity.animation(.easeIn(duration: 1.0)))
                                BarbButtonView(title: "Войти в личный кабинет", action: {
                                    print("Кнопка сработала")
                                    print(signInIsPresented)
                                    signInIsPresented.toggle() }, width: 247, height: 47)
                                .transition(.opacity.animation(.easeIn(duration: 1.0).delay(1.5)))
                            }
                            Spacer()
                        }
                        .padding(.horizontal, 30)
                        .padding(.top, 100)
                    }
                }
            }
            .fullScreenCover(isPresented: $signInIsPresented) {
                SignInView(email: "", password: "", signInIsPresented: $signInIsPresented)
            }
            .onAppear {
                withAnimation {
                    showText1 = true
                }
            }
            .onTapGesture {
                if showText1 {
                    showText1 = false
                    showText2 = true
                } else if showText2 {
                    showText2 = false
                    showText3 = true
                } else if showText4 || showText5 || showText6 {
                    showText1 = false
                    showText2 = false
                    showText3 = false
                }
            }
        }
    }
}


#Preview {
    HelloView()
}
