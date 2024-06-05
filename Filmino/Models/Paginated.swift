//
//  Paginated.swift
//  Filmino
//
//  Created by Furkan Açıkgöz on 5.06.2024.
//

import Foundation

struct Paginated<Item: Decodable>: Decodable {
    let page: Int
    let results: [Item]
    let totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results, totalPages = "total_pages"
    }
}
