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
    
    func detailsOfMovie(with id: Int) async throws -> Movie {
        try await ApiClient.getMediaDetails(mediaType: .movie,
                                            with: id)
    }
    
    func detailsOfShow(with id: Int) async throws -> Show {
        try await ApiClient.getMediaDetails(mediaType: .tv,
                                            with: id)
    }
    
}
