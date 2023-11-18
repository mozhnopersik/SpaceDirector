//
//  SpaceView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 15.11.2023.
//

import SwiftUI

struct SpaceView: View {
    
    @ObservedObject var viewModel: NASAViewModel
    @State private var titleOfPhoto = ""
    
    init(titleOfPhoto: String, viewModel: NASAViewModel) {
        self._titleOfPhoto = State(initialValue: titleOfPhoto)
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Image("BackgroundTwo")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 10) {
                RegularText(text: "А тут изображение дня от NASA", 
                            color: .white,
                            size: 30)
                    .padding(.trailing, 30)
                RegularText(text: "На этом фото:", 
                            color: .white,
                            size: 15)
                RegularText(text: viewModel.title, 
                            color: .white,
                            size: 20)
                ScrollView (showsIndicators: false) {
                    ImageOfSpace(viewModel: viewModel)
                    RegularText(text: viewModel.explanation, 
                                color: .white,
                                size: 15)
                        .padding(.top, 320)
                    RegularText(text: viewModel.copyright, 
                                color: .white,
                                size: 15)
                        .padding(.top, 10)
                        .padding(.bottom, 160)
                }
            }
            .padding(.horizontal, 32)
            .padding(.top, 100)
        }
        .onAppear {
            viewModel.fetchAPOD()
        }
    }
}

struct ImageOfSpace: View {
    @ObservedObject var viewModel: NASAViewModel
    
    var body: some View {
        GeometryReader { geometry in
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: geometry.size.width, height: geometry.size.width)
                    .cornerRadius(15)
            }
        }
    }
}

#Preview {
    SpaceView(titleOfPhoto: "", viewModel: NASAViewModel())
}
