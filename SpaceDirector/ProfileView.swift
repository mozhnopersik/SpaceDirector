//
//  ProfileView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 14.11.2023.
//

import SwiftUI

struct ProfileView: View {
   
    @AppStorage("isUserAuthenticated") var isUserAuthenticated: Bool?
    @State private var myDataEditingIsPresented = false
    @StateObject private var userManager = UserManager.shared
    let user = UserManager.shared.currentUser
    
    var body: some View {
        ZStack {
            Image("BackgroundTwo")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack (alignment: .leading, spacing: 10) {
                RegularText(text: "Доброго дня, профессор \(userManager.currentUser.name)", color: .white, size: 30)
                RegularText(text: "Вот немного информации о вас", color: .white, size: 15)
                ZStack {
                    ProfileDataView()
                    Button(action: {
                        print("jhghkg")
                        myDataEditingIsPresented.toggle()
                    }) {
                        Image("Edit")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding(.bottom, 245)
                            .padding(.leading, 230)
                    }
                }
                RegularText(text: "Кстати, ее можно изменить в настройках, для этого нажмите на карандашик сверху", color: .white, size: 15)
                RegularText(text: "А еще вы можете:", color: .white, size: 15)
                BarbButtonView(title: "выйти из профиля",
                               action: { 
                    print("Кнопка была нажата")
                    isUserAuthenticated = false
                    print("Сейчас статуc залогиненности \(String(describing: isUserAuthenticated))")},
                               width: 170,
                               height: 47)
                Spacer()
                
            }
            .sheet(isPresented: $myDataEditingIsPresented) {
                MyDataEditingView(myName: userManager.currentUser.name, myAge: userManager.currentUser.age, myExperience: userManager.currentUser.experience, myPost: userManager.currentUser.post, photoIsToggleOn: userManager.currentUser.photoIsToggleOn, myDataEditingIsPresented: $myDataEditingIsPresented)
            }
            .padding(.horizontal, 30)
            .padding(.top, 100)
        }
        .onAppear {
            isUserAuthenticated = true
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
                    RegularText(text: "Ваше имя:", color: Color("Barb"), size: 15)
                    RegularText(text: "Ваш возраст:", color: Color("Barb"), size: 15)
                    RegularText(text: "Ваш стаж:", color: Color("Barb"), size: 15)
                    RegularText(text: "Ваша должность:", color: Color("Barb"), size: 15)
                }
                VStack (alignment: .leading, spacing: 10) {
                    RegularText(text: userManager.currentUser.name, color: Color("Barb"), size: 15)
                    RegularText(text: userManager.currentUser.age, color: Color("Barb"), size: 15)
                    RegularText(text: userManager.currentUser.experience, color: Color("Barb"), size: 15)
                    RegularText(text: userManager.currentUser.post, color: Color("Barb"), size: 15)
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
