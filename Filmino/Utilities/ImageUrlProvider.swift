//
//  ImageUrlProvider.swift
//  Filmino
//
//  Created by Furkan Açıkgöz on 7.06.2024.
//

import Foundation

enum ImageUrlProvider: String {
    case original, w780, w500
    
    func provideUrl(for path: String) -> String {
        "https://image.tmdb.org/t/p/\(rawValue)\(path)"
    }
}
