//
//  Movie.swift
//  Filmino
//
//  Created by Furkan Açıkgöz on 5.06.2024.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
    }
}
