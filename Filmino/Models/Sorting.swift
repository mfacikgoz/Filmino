//
//  Sorting.swift
//  Filmino
//
//  Created by Furkan Açıkgöz on 5.06.2024.
//

import Foundation

enum Sorting: String, Codable {
    case popularityAscending = "popularity.asc"
    case popularityDescending = "popularity.desc"
    case voteAverageAscending = "vote_average.asc"
    case voteAverageDescending = "vote_average.desc"
    case voteCountAscending = "vote_count.asc"
    case voteCountDescending = "vote_count.desc"
}
