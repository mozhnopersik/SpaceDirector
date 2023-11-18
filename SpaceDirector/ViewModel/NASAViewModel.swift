//
//  NASAViewModel.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 18.11.2023.
//

import SwiftUI

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
                    self?.title = apodResponse.title ?? "Загрузка..."
                    self?.explanation = apodResponse.explanation ?? "Если вы долго видите эту надпись, скорее всего что-то не так с интернетом или со стороны сайта NASA."
                    self?.copyright = apodResponse.copyright ?? "Copyright not founded"
                    
                    if let imageUrl = URL(string: apodResponse.url) {
                        URLSession.shared.dataTask(with: imageUrl) { data, _, error in
                            if let data = data, let image = UIImage(data: data) {
                                DispatchQueue.main.async {
                                    self?.image = image
                                }
                            } else if let error = error {
                                print("Ошибка загрузки изображения: \(error)")
                                self?.image = UIImage(named: "Placeholder")
                            }
                        }.resume()
                    }
                }
            case .failure(let error):
                print("Ошибка загрузки APOD: \(error)")
            }
        }
    }
}
