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
    
    @State private var password = ""
    @State private var email = ""
    
    @Binding var signInIsPresented: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("BackgroundTwo")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack (alignment: .leading) {
                    RegularText(text: "Введите ваши данные", 
                                color: .white,
                                size: 25)
                    BarbButton(title: "Где мне их взять? ", 
                               action: { self.isPresentingWhereAlert.toggle() },
                               width: 147,
                               height: 36)
                        .padding(.bottom, 10)
                    RegularText(text: "Логин:", 
                                color: .white,
                                size: 15)
                    WhiteTextField(text: $email, 
                                   placeholder: "")
                        .disableAutocorrection(true)
                        .padding(.bottom, 10)
                    RegularText(text: "Пароль:", 
                                color: .white,
                                size: 15)
                    PasswordTextField(text: $password, 
                                      placeholder: "")
                        .disableAutocorrection(true)
                        .padding(.bottom, 10)
                    HStack {
                        Button(action: {
                            self.isPresentingLoginAlert.toggle()
                        }) {
                            RegularText(text: "Забыли логин?", 
                                        color: .white,
                                        size: 15)
                        }
                        Spacer()
                        Button(action: {
                            isPresentingPasswordAlert.toggle()
                        }) {
                            RegularText(text: "Забыли пароль?", 
                                        color: .white,
                                        size: 15)
                        }
                    }
                    .padding(.bottom, 10)
                    HStack {
                        Spacer()
                        SignInButton(password: $password, 
                                     email: $email)
                        Spacer()
                    }
                    Spacer()
                }
                .padding(.horizontal, 35)
                .padding(.top, 100)
                
                presentationAlert(isPresented: $isPresentingWhereAlert) {
                    WhereIsDataAlertView(whereIsDataAlertViewModel: WhereIsDataAlertViewModel(isPresentingWhereAlert: $isPresentingWhereAlert))
                }
                
                presentationAlert(isPresented: $isPresentingLoginAlert) {
                    ForgotLoginAlertView(forgotLoginAlertViewModel: ForgotLoginAlertViewModel(isPresentingLoginAlert: $isPresentingLoginAlert, email: $email))
                }
                
                presentationAlert(isPresented: $isPresentingPasswordAlert) {
                    ForgotPasswordAlertView(forgotPasswordAlertViewModel: ForgotPasswordAlertViewModel(isPresentingPasswordAlert: $isPresentingPasswordAlert, password: $password))
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
    
    private func presentationAlert<Content: View>(isPresented: Binding<Bool>, @ViewBuilder alert: @escaping () -> Content) -> some View {
        VStack {
            Spacer()
            alert()
            Spacer()
        }
        .background(
            Color.black.opacity(0.3)
                .frame(width: 700, height: 1300)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        isPresented.wrappedValue.toggle()
                    }
                })
        .transition(.opacity.animation(.easeIn(duration: 0.2)))
        .opacity(isPresented.wrappedValue ? 1 : 0)
    }
}

struct SignInButton: View {
    
    @Binding var password: String
    @Binding var email: String
    
    let user = UserManager.shared.currentUser
    
    var body: some View {
        if password == user.password && email == user.email {
            NavigationLink(destination: YeyView()) {
                RegularText(text: "Войти", 
                            color: .white,
                            size: 25)
            }
        } else {
            Button(action: {
                print("Неверные данные")
            }){
                RegularText(text: "Войти", 
                            color: .white,
                            size: 25)
            }
        }
    }
}

#Preview {
    SignInView(signInIsPresented: .constant(true))
}
