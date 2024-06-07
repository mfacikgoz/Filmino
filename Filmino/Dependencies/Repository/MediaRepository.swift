//
//  MediaRepository.swift
//  Filmino
//
//  Created by Furkan Açıkgöz on 5.06.2024.
//

import Foundation

class MediaRepository {
    
    
    func discoverMovies(page: Int = 1) async throws -> Paginated<Movie> {
        try await ApiClient.getMedia(mediaType: .movie,
                                     page: page,
                                     sorting: .popularityDescending)
    }
    
    func discoverShows(page: Int = 1) async throws -> Paginated<Show> {
        try await ApiClient.getMedia(mediaType: .tv,
                                     sorting: .popularityDescending)
    }
    
    
}
