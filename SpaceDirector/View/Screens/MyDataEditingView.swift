//
//  NewContactView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 14.11.2023.
//

import SwiftUI

struct MyDataEditingView: View {
    
    @ObservedObject var viewModel: MyDataEditingViewModel

    @Binding var myDataEditingIsPresented: Bool
    
    var body: some View {
        ZStack {
            Image("BackgroundTwo")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack (alignment: .leading) {
                RegularText(text: "Тут можно изменить данные", 
                            color: .white,
                            size: 25)
                    .padding(.bottom, 20)
                    .padding(.trailing, 30)
                
                RegularText(text: "Ваше имя:", 
                            color: .white,
                            size: 15)
                WhiteTextField(text: $viewModel.myName, placeholder: "")
                    .padding(.bottom, 10)
                RegularText(text: "Ваш возраст:", 
                            color: .white,
                            size: 15)
                WhiteTextField(text: $viewModel.myAge, placeholder: "")
                    .padding(.bottom, 10)
                
                RegularText(text: "Ваш стаж:", 
                            color: .white,
                            size: 15)
                WhiteTextField(text: $viewModel.myExperience, placeholder: "")
                    .padding(.bottom, 10)
                RegularText(text: "Ваша должность:", 
                            color: .white,
                            size: 15)
                WhiteTextField(text: $viewModel.myPost, placeholder: "")
                    .padding(.bottom, 10)
                Toggle(isOn: $viewModel.photoIsToggleOn, label: {
                    RegularText(text: "А тут скоро можно будет сменить фото на мужское (пока так)", 
                                color: .white,
                                size: 15)
                })
                Spacer()
                HStack {
                    Spacer()
                    BarbButton(title: "Сохранить", 
                               action: {
                        viewModel.saveChanges()
                        myDataEditingIsPresented.toggle()},
                               width: 147,
                               height: 47)
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
    MyDataEditingView(viewModel: MyDataEditingViewModel(userManager: UserManager()), 
                      myDataEditingIsPresented: .constant(true))
}
