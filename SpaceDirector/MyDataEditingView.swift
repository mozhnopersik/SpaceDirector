//
//  NewContactView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 14.11.2023.
//

import SwiftUI

struct MyDataEditingView: View {
    @State private var myName: String = UserManager.shared.currentUser.name
    @State private var myAge: String = UserManager.shared.currentUser.age
    @State private var myExperience: String = UserManager.shared.currentUser.experience
    @State private var myPost: String = UserManager.shared.currentUser.post
    @State private var photoIsToggleOn: Bool = UserManager.shared.currentUser.photoIsToggleOn

    @Binding var myDataEditingIsPresented: Bool

    
    init(myName: String, myAge: String, myExperience: String, myPost: String, photoIsToggleOn: Bool, myDataEditingIsPresented: Binding<Bool>) {
        self._myName = State(initialValue: myName)
        self._myAge = State(initialValue: myAge)
        self._myExperience = State(initialValue: myExperience)
        self._myPost = State(initialValue: myPost)
        self._photoIsToggleOn = State(initialValue: photoIsToggleOn)
        self._myDataEditingIsPresented = myDataEditingIsPresented
    }
    
    var body: some View {
        ZStack {
            Image("BackgroundTwo")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack (alignment: .leading) {
                RegularText(text: "Тут можно изменить данные", color: .white, size: 25)
                    .padding(.bottom, 20)
                    .padding(.trailing, 30)
                
                RegularText(text: "Ваше имя:", color: .white, size: 15)
                WhiteTextField(text: $myName, placeholder: "")
                    .padding(.bottom, 10)
                RegularText(text: "Ваш возраст:", color: .white, size: 15)
                WhiteTextField(text: $myAge, placeholder: "")
                    .padding(.bottom, 10)
                
                RegularText(text: "Ваш стаж:", color: .white, size: 15)
                WhiteTextField(text: $myExperience, placeholder: "")
                    .padding(.bottom, 10)
                RegularText(text: "Ваша должность:", color: .white, size: 15)
                WhiteTextField(text: $myPost, placeholder: "")
                    .padding(.bottom, 10)
                Toggle(isOn: $photoIsToggleOn, label: {
                    RegularText(text: "А тут скоро можно будет сменить фото на мужское (пока так)", color: .white, size: 15)
                })
                
                Spacer()
                HStack {
                    Spacer()
                    BarbButtonView(title: "Сохранить", action: {
                        UserManager.shared.updateCurrentUser(name: myName, age: myAge, experience: myExperience, post: myPost)
                        print(UserManager.shared.currentUser.name)
                        myDataEditingIsPresented.toggle()
                    }, width: 147, height: 47)
                    Spacer()
                }
                .padding(.bottom, 60)
            }
            .padding(.horizontal, 35)
            .padding(.top, 100)
            
        }
    }
}

#Preview {
    MyDataEditingView(myName: "", myAge: "", myExperience: "", myPost: "", photoIsToggleOn: true, myDataEditingIsPresented: .constant(true))
}
