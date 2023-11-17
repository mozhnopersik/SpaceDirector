//
//  CustomTabBarView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 14.11.2023.
//

import SwiftUI

struct CustomTabBarView: View {
    @State private var tabSelection = 1
    @Binding var nameOfContact: String
    @Binding var newContactIsPresented: Bool
    var body: some View {
        TabView(selection: $tabSelection) {
                
            ContactsView().tag(1)
            Text("Tab Content 2").tag(2)
        }
        .overlay(alignment: .bottom) {
            TabBarView(tabSelection: $tabSelection)
        }
    }
}

//#Preview {
//    CustomTabBarView(nameOfContact: .constant("Tim Cook"), newContactIsPresented: .constant(false))
//}
