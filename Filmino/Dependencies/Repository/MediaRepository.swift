//
//  MediaRepository.swift
//  Filmino
//
//  Created by Furkan Açıkgöz on 5.06.2024.
//

import Foundation

class MediaRepository {
    
    private let apiManager: ApiManager = .shared
    
    private let apiClient: ApiClient = .shared
    
    private let preferencesManager: PreferencesManager = .shared
    
    func discoverMovies(page: Int = 1) async throws -> Paginated<Movie> {
        try await apiClient.getMedia(mediaType: .movie,
                           page: page,
                           sorting: .popularityDescending)
    }
    
    func discoverShows() async throws -> [Show] {
        try await apiClient.getMedia(mediaType: .tv,
                           sorting: .popularityDescending).results
    }
    
    func userMovies() async throws -> [Movie] {
        try await apiClient.getMedia(mediaType: .movie,
                           sorting: .popularityDescending,
                           genres: preferencesManager.userGenres).results
    }
    
    func userShows() async throws -> [Show] {
        try await apiClient.getMedia(mediaType: .tv,
                           sorting: .popularityDescending,
                           genres: preferencesManager.userGenres).results
    }
    
}
