//
//  ContentView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 12.11.2023.
//

import SwiftUI

struct HelloView: View {
    
    @State private var showHelloText = false
    @State private var showMyNameText = false
    @State private var showDescriptionText = false
    @State private var showImaginationText = false
    @State private var showAboutText = false
    @State private var showOkOkText = false
    
    @State private var signInIsPresented = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                if showHelloText || showMyNameText || showDescriptionText {
                    Image("Background")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()

                    if showHelloText {
                        ZStack {
                            RegularText(text: "Привет", 
                                        color: .white,
                                        size: 30)
                                .transition(.opacity.animation(.easeIn(duration: 1.0)))
                            RegularText(text: "tap  here :)", 
                                        color: .white,
                                        size: 15)
                                .padding(.top, 300)
                                .transition(.opacity.animation(.easeIn(duration: 1.0)))
                        }
                    }
                    
                    if showMyNameText {
                        RegularText(text: "Меня зовут Рони", 
                                    color: .white,
                                    size: 30)
                            .transition(.opacity.animation(.easeIn(duration: 1.0)))
                    }
                    
                    if showDescriptionText {
                        RegularText(text: "И сейчас я постараюсь продемонстрировать вам часть технологий, которыми я владею", 
                                    color: .white,
                                    size: 30)
                            .padding()
                            .transition(.opacity.animation(.easeIn(duration: 1.0)))
                            .multilineTextAlignment(.center)
                        
                        BarbButton(title: "Давай", 
                                   action: {
                            showImaginationText = true
                            showDescriptionText = false
                        }, 
                                   width: 132,
                                   height: 47)
                        .padding(.top, 400)
                        .transition(.opacity.animation(.easeIn(duration: 1.0).delay(1.0)))
                    }
                    
                } else {
                    ZStack {
                        Image("BackgroundTwo")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                        VStack (alignment: .leading, spacing: 25) {
                            if showImaginationText {
                                RegularText(text: "Предлагаю представить, что вы студент-астрофизик из NASA", 
                                            color: .white,
                                            size: 25)
                                    .transition(
                                        .opacity
                                            .animation(
                                                .easeIn(duration: 1.0)
                                            )
                                    )
                                BarbButton(title: "Ну допустим",
                                           action: { showAboutText = true },
                                           width: 168,
                                           height: 47)
                                    .transition(
                                        .opacity
                                            .animation(
                                                .easeIn(duration: 1.0)
                                                .delay(0.5)
                                            )
                                    )
                            }
                            if showAboutText {
                                RegularText(text: "И это ваш личный кабинет в приложении агенства", 
                                            color: .white,
                                            size: 25)
                                    .transition(
                                        .opacity
                                            .animation(
                                                .easeIn(duration: 1.0)
                                            )
                                    )
                                
                                BarbButton(title: "Так, и что теперь?", 
                                           action: { showOkOkText = true },
                                           width: 204,
                                           height: 47)
                                    .transition(
                                        .opacity
                                            .animation(
                                                .easeIn(duration: 1.0)
                                                .delay(0.5)
                                            )
                                    )
                            }
                            if showOkOkText {
                                RegularText(text: "Все-все, не томлю, заходите :)", 
                                            color: .white,
                                            size: 25)
                                    .padding(.trailing)
                                    .transition(
                                        .opacity
                                            .animation(
                                                .easeIn(duration: 1.0)
                                            )
                                    )
                                BarbButton(title: "Войти в личный кабинет",
                                           action: { signInIsPresented.toggle() },
                                           width: 247,
                                           height: 47)
                                .transition(
                                    .opacity
                                    .animation(
                                        .easeIn(duration: 1.0)
                                        .delay(0.5)
                                    )
                                )
                            }
                            Spacer()
                        }
                        .padding(.horizontal, 30)
                        .padding(.top, 100)
                    }
                }
            }
            .fullScreenCover(isPresented: $signInIsPresented) {
                SignInView(signInIsPresented: $signInIsPresented)
            }
            .onAppear {
                withAnimation {
                    showHelloText = true
                }
            }
            .onTapGesture {
                if showHelloText {
                    showHelloText = false
                    showMyNameText = true
                } else if showMyNameText {
                    showMyNameText = false
                    showDescriptionText = true
                } else if showImaginationText || showAboutText || showOkOkText {
                    showHelloText = false
                    showMyNameText = false
                    showDescriptionText = false
                }
            }
        }
    }
}

#Preview {
    HelloView()
}
