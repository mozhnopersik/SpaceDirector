//
//  SignInView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 13.11.2023.
//

import SwiftUI

struct SignInView: View {

    @State private var isPresentingWhereAlert = false
    @State private var isPresentingLoginAlert = false
    @State private var isPresentingPasswordAlert = false
    
    @State private var password: String
    @State private var email: String
    
    @Binding var signInIsPresented: Bool
    
    init(email: String, password: String, signInIsPresented: Binding<Bool>) {
        self._email = State(initialValue: email)
        self._password = State(initialValue: password)
        self._signInIsPresented = signInIsPresented
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("BackgroundTwo")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack (alignment: .leading) {
                    RegularText(text: "Введите ваши данные", color: .white, size: 25)
                    BarbButton(title: "Где мне их взять? ", action: {self.isPresentingWhereAlert.toggle()}, width: 147, height: 36)
                        .padding(.bottom, 10)
                    RegularText(text: "Логин:", color: .white, size: 15)
                    WhiteTextField(text: $email, placeholder: "")
                        .disableAutocorrection(true)
                        .padding(.bottom, 10)
                    RegularText(text: "Пароль:", color: .white, size: 15)
                    PasswordTextField(text: $password, placeholder: "")
                        .disableAutocorrection(true)
                        .padding(.bottom, 10)
                    HStack {
                        Button(action: {
                            self.isPresentingLoginAlert.toggle()
                        }) {
                            RegularText(text: "Забыли логин?", color: .white, size: 15)
                        }
                        Spacer()
                        Button(action: {
                            isPresentingPasswordAlert.toggle()
                        }) {
                            RegularText(text: "Забыли пароль?", color: .white, size: 15)
                        }
                    }
                    .padding(.bottom, 10)
                    HStack {
                        Spacer()
                        SignInButton(password: $password, email: $email)
                        Spacer()
                    }
                    Spacer()
                }
                .padding(.horizontal, 35)
                .padding(.top, 100)
                
                if isPresentingWhereAlert {
                    VStack {
                        Spacer()
                        WhereIsDataAlertView(whereIsDataAlertViewModel: WhereIsDataAlertViewModel(isPresentingWhereAlert: $isPresentingWhereAlert))
                        Spacer()
                    }
                    .background(
                        Color.black.opacity(0.3)
                            .ignoresSafeArea()
                            .onTapGesture {
                                withAnimation {
                                    self.isPresentingWhereAlert.toggle()
                                }
                            })
                    .transition(.opacity.animation(.easeIn(duration: 0.2)))
                }
                
                if isPresentingLoginAlert {
                    VStack {
                        Spacer()
                        ForgotLoginAlertView(forgotLoginAlertViewModel: ForgotLoginAlertViewModel(isPresentingLoginAlert: $isPresentingLoginAlert, email: $email))
                        
                        Spacer()
                    }
                    .background(
                        Color.black.opacity(0.3)
                            .ignoresSafeArea()
                            .onTapGesture {
                                withAnimation {
                                    self.isPresentingLoginAlert.toggle()
                                }
                            })
                    .transition(.opacity.animation(.easeIn(duration: 0.2)))
                }
                
                if isPresentingPasswordAlert {
                    VStack {
                        Spacer()
                        ForgotPasswordAlertView(forgotPasswordAlertViewModel: ForgotPasswordAlertViewModel(isPresentingPasswordAlert: $isPresentingPasswordAlert, password: $password))
                        
                        Spacer()
                    }
                    .background(
                        Color.black.opacity(0.3)
                            .ignoresSafeArea()
                            .onTapGesture {
                                withAnimation {
                                    self.isPresentingPasswordAlert.toggle()
                                }
                            })
                    .transition(.opacity.animation(.easeIn(duration: 0.2)))
                }
            }
            .onAppear {
                withAnimation {
                    isPresentingWhereAlert = false
                }
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

struct SignInButton: View {
    
    @Binding var password: String
    @Binding var email: String
    
    let user = UserManager.shared.currentUser
    
    var body: some View {
        if password == user.password && email == user.email {
            NavigationLink(destination: YeyView()) {
                RegularText(text: "Войти", color: .white, size: 25)
            }
        } else {
            Button(action: {
                print("Неверные данные")
            }){
                RegularText(text: "Войти", color: .white, size: 25)
            }
        }
    }
}


#Preview {
    SignInView(email: "", password: "", signInIsPresented: .constant(true))
}
