//
//  SpaceView.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 15.11.2023.
//

import SwiftUI
import Alamofire

struct SpaceView: View {
    @ObservedObject var viewModel: NASAViewModel
    @State private var titleOfPhoto: String
    
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
                RegularText(text: "А тут изображение дня от NASA", color: .white, size: 30)
                    .padding(.trailing, 30)
                RegularText(text: "На этом фото:", color: .white, size: 15)
                RegularText(text: viewModel.title, color: .white, size: 20)
                ScrollView {
                    ImageOfSpace(viewModel: viewModel)
                    RegularText(text: viewModel.explanation, color: .white, size: 15)
                        .padding(.top, 320)
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

class NASAViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var explanation: String = ""
    @Published var image: UIImage?
    @Published var copyright: String = ""

    func fetchAPOD() {
        RequestManager.shared.fetchAPOD { [weak self] result in
            switch result {
            case .success(let apodResponse):
                DispatchQueue.main.async {
                    self?.title = apodResponse.title
                    self?.explanation = apodResponse.explanation
                    self?.copyright = apodResponse.copyright ?? "Copyright not founded"
                    
                    if let imageUrl = URL(string: apodResponse.url) {
                        URLSession.shared.dataTask(with: imageUrl) { data, _, error in
                            if let data = data, let image = UIImage(data: data) {
                                DispatchQueue.main.async {
                                    self?.image = image
                                }
                            } else if let error = error {
                                print("Error loading image: \(error)")
                            }
                        }.resume()
                    }
                }
            case .failure(let error):
                print("Error fetching APOD: \(error)")
            }
        }
    }
}
#Preview {
    SpaceView(titleOfPhoto: "", viewModel: NASAViewModel())
}
