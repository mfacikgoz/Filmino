//
//  MovieDetailViewModel.swift
//  Filmino
//
//  Created by Furkan Açıkgöz on 9.07.2024.
//

import Foundation
import Combine

class MovieDetailViewModel {
    
    private let mediaRepository: MediaRepository
    private let id: Int
    
    let data = PassthroughSubject<Movie, Never>()
    
    init(mediaRepository: MediaRepository, movieId: Int) {
        self.mediaRepository = mediaRepository
        self.id = movieId
    }
    
    func start() {
        Task {
            await fetchData()
        }
    }
    
    private func fetchData() async {
        do {
            let details = try await mediaRepository.detailsOfMovie(with: id)
            data.send(details)
        } catch {
            print(error)
        }
    }
}
