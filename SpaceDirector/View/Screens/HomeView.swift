//
//  HomeView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 14.11.2023.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModelOfNASA: NASAViewModel
    @State private var tabSelection = 1
    
    @EnvironmentObject private var сontactData: ContactData

    var body: some View {
        NavigationStack {
            TabView(selection: $tabSelection) {
                
                ProfileView().tag(1)
                ContactListView().tag(2)
                SpaceView(titleOfPhoto: "", viewModel: viewModelOfNASA).tag(3)
                SettingsView().tag(4)
            }
            .overlay(alignment: .bottom) {
                TabBarView(tabSelection: $tabSelection)
            }
        }
        .onAppear {
            viewModelOfNASA.fetchAPOD()
        }
    }
}

#Preview {
    HomeView(viewModelOfNASA: NASAViewModel())
        .environmentObject(ContactData())
}