//
//  MoviesViewModel.swift
//  Filmino
//
//  Created by Furkan Açıkgöz on 7.06.2024.
//

import Foundation
import Combine

class MoviesViewModel {
    
    private let mediaRepository: MediaRepository
    
    let movies: CurrentValueSubject<[Movie], Never> = .init([])
    
    let error: PassthroughSubject<Error, Never> = .init()
    
    private var currentPage: Int = 0
    private var maxPageCount: Int = 1
    
    init(mediaRepository: MediaRepository) {
        self.mediaRepository = mediaRepository
    }
    
    func start() {
        Task {
            await fetchData()
        }
    }
    
    func didScrollToBottom() {
        Task {
            await fetchData()
        }
    }
    
    func didSelectMovie(at index: Int) {
        let movie = movies.value[index]
        // TODO: Route to movie detail
    }
    
    private func fetchData() async {
        guard currentPage < maxPageCount else { return }
        currentPage += 1
        do {
            let response = try await mediaRepository.discoverMovies(page: currentPage)
            maxPageCount = response.totalPages
            var currentValue = movies.value
            currentValue.append(contentsOf: response.results)
            movies.send(currentValue)
        } catch {
            self.error.send(error)
        }
    }
}

