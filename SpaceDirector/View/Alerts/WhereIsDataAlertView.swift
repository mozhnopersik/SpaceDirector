//
//  CustomAlertView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 13.11.2023.
//

import SwiftUI

struct WhereIsDataAlertView: View {
    @ObservedObject var whereIsDataAlertViewModel: WhereIsDataAlertViewModel

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 22.0)
                .frame(width: 290, height: 140)
                .foregroundColor(.white)
            HorizontalLine(width: 290)
                .padding(.top, 60)
            VStack (spacing: 23) {
                VStack (spacing: 3) {
                    RegularText(text: whereIsDataAlertViewModel.whereIsDataAlertModel.title, color: Color("Barb"), size: 15)
                    RegularText(text: whereIsDataAlertViewModel.whereIsDataAlertModel.message, color: Color("Barb"), size: 15)
                        .padding(.horizontal, 60)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 3)
                Button(action: {
                    whereIsDataAlertViewModel.cancel()
                }) {
                    RegularText(text: whereIsDataAlertViewModel.whereIsDataAlertModel.buttonText, color: Color("Barb"), size: 15)
                }
                .padding(.top, 0)
            }
            
        }
        .background(Color.clear)
    }
}

#Preview {
    WhereIsDataAlertView(whereIsDataAlertViewModel: WhereIsDataAlertViewModel(isPresentingWhereAlert: .constant(true)))
}
