//
//  ApiClient.swift
//  Filmino
//
//  Created by Furkan Açıkgöz on 5.06.2024.
//

import Foundation


class ApiClient {
    
    private let apiManager: ApiManager = .shared
    
    static let shared: ApiClient = ApiClient()
    
    func getMedia<Media: Decodable>(mediaType: MediaType,
                                           page: Int = 1,
                                           sorting: Sorting,
                                           genres: [Genre] = []) async throws -> Paginated<Media> {
        try await apiManager.execute(path: "/discover/\(mediaType.rawValue)",
                                     method: .get,
                                     parameters: [
                                        "page": page,
                                        "sort_by": sorting.rawValue,
                                        "with_genres": genres.asOrList()
                                     ],
                                     expect: Paginated<Media>.self)
    }
}

