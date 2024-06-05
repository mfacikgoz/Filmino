//
//  Genre.swift
//  Filmino
//
//  Created by Furkan Açıkgöz on 5.06.2024.
//

import Foundation

struct Genre: Codable {
    let id: Int
    let title: String
}

extension Array where Element == Genre {
    func asOrList() -> String {
        self.map {
            "\($0.id)"
        }.joined(separator: "|")
    }
}

