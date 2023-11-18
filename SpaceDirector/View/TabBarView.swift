//
//  TabBarView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 14.11.2023.
//

import SwiftUI

struct TabBarView: View {
    @Binding var tabSelection: Int
    @Namespace private var animationNamespace
    
    let tabBarItems: [(image: String, title: String)] = [
        ("person.fill", "Profile"),
        ("list.star", "Contacts"),
        ("globe.europe.africa.fill", "Space"),
        ("gearshape.fill", "Settings")
    ]

    var body: some View {
        ZStack {
            Capsule()
                .frame(height: 80)
                .foregroundColor(Color.white)
            
            HStack {
                ForEach(0..<4) { index in
                    Button {
                        tabSelection = index + 1
                    } label: {
                        VStack(spacing: 6) {
                            Spacer()
                            Image(systemName: tabBarItems[index].image)
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text(tabBarItems[index].title)
                                .font(.custom("TildaSans-Regular", size: 15))
                            if index + 1 == tabSelection {
                                Capsule()
                                    .frame(height: 5)
                                    .foregroundStyle(Color("Peach"))
                                    .matchedGeometryEffect(id: "SelectedTabID", in: animationNamespace)
                            } else {
                                Capsule()
                                    .frame(height: 5)
                                    .foregroundStyle(Color.clear)
                            }
                        }
                        .foregroundColor(index + 1 == tabSelection ? Color("Peach") : Color("Barb"))
                    }
                }
            }
            .padding(.horizontal)
            .frame(height: 80)
            .clipShape(Capsule())
        }
        .padding(.horizontal)
    }
}


#Preview {
    TabBarView(tabSelection: .constant(2))
}
