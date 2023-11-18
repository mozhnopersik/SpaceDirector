//
//  NASAViewModel.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 18.11.2023.
//

import Foundation
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
