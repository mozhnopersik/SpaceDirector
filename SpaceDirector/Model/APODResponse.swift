//
//  APODResponse.swift
//  SpaceDirector
//
//  Created by Вероника Карпова on 15.11.2023.
//

struct APODResponse: Decodable {
    let url: String
    let title: String?
    let explanation: String?
    let copyright: String?
    
    enum CodingKeys: String, CodingKey {
        case url
        case title
        case explanation
        case copyright
    }
}
