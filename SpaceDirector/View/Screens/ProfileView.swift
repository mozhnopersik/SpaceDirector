//
//  ProfileView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 14.11.2023.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("isUserAuthenticated") var isUserAuthenticated: Bool?
    
    @StateObject private var userManager = UserManager.shared
    @State private var myDataEditingIsPresented = false
    
    var body: some View {
        ZStack {
            Image("BackgroundTwo")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            ScrollView (showsIndicators: false) {
                VStack (alignment: .leading, spacing: 10) {
                    RegularText(text: "Доброго дня, профессор \(userManager.currentUser.name)", 
                                color: .white,
                                size: 30)
                    RegularText(text: "Вот немного информации о вас:", 
                                color: .white,
                                size: 15)
                    ZStack {
                        ProfileDataView()
                        Button(action: {
                            myDataEditingIsPresented.toggle()
                        }) {
                            Image("Edit")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding(.bottom, 245)
                                .padding(.leading, 230)
                        }
                    }
                    RegularText(text: "Кстати, ее можно изменить в настройках, для этого нажмите на карандашик сверху.", 
                                color: .white,
                                size: 15)
                    RegularText(text: "Если вы здесь первый раз, то вы можете добавить свое имя и другие данные и они будут здесь отображаться :)", 
                                color: .white,
                                size: 15)
                    HStack {
                        Spacer()
                        VStack {
                            RegularText(text: "А еще вы можете:", 
                                        color: .white,
                                        size: 15)
                            BarbButton(title: "выйти из профиля",
                                       action: { isUserAuthenticated = false },
                                       width: 170,
                                       height: 47)
                        }
                        Spacer()
                    }
                    Spacer()
                }
                .sheet(isPresented: $myDataEditingIsPresented) {
                    MyDataEditingView(viewModel: MyDataEditingViewModel(userManager: UserManager()), 
                                      myDataEditingIsPresented: $myDataEditingIsPresented)
                }
                .padding(.horizontal, 30)
                .padding(.top, 100)
            }
        }
        .toolbar(.hidden)
    }
}

struct ProfileDataView: View {
    @StateObject private var userManager = UserManager.shared
    
    var body: some View {
        ZStack {
            WhiteRectangle()
            Image("PhotoOfProfile")
                .resizable()
                .frame(width: 150, height: 150)
                .offset(y: -73)
            HStack (spacing: 40) {
                VStack (alignment: .leading, spacing: 10) {
                    RegularText(text: "Ваше имя:", 
                                color: Color("Barb"),
                                size: 15)
                    RegularText(text: "Ваш возраст:", 
                                color: Color("Barb"),
                                size: 15)
                    RegularText(text: "Ваш стаж:", 
                                color: Color("Barb"),
                                size: 15)
                    RegularText(text: "Ваша должность:", 
                                color: Color("Barb"),
                                size: 15)
                }
                VStack (alignment: .leading, spacing: 10) {
                    RegularText(text: userManager.currentUser.name, 
                                color: Color("Barb"),
                                size: 15)
                    RegularText(text: userManager.currentUser.age, 
                                color: Color("Barb"),
                                size: 15)
                    RegularText(text: userManager.currentUser.experience, 
                                color: Color("Barb"),
                                size: 15)
                    RegularText(text: userManager.currentUser.post, 
                                color: Color("Barb"),
                                size: 15)
                }
            }
            .offset(y: 80)
        }
    }
}

struct WhiteRectangle: View {
    var body: some View {
        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
            .frame(width: 314, height: 331)
    }
}

#Preview {
    ProfileView()
}
