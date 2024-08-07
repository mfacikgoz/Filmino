//
//  Show.swift
//  Filmino
//
//  Created by Furkan Açıkgöz on 5.06.2024.
//

import Foundation

struct Show: Codable {
    let id: Int
    let name: String
    let tagline: String?
    let overview: String?
    let posterPath: String?
    let backdropPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case tagline
        case overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}

