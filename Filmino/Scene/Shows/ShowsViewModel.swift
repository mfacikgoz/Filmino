//
//  ShowsViewModel.swift
//  Filmino
//
//  Created by Furkan Açıkgöz on 7.06.2024.
//

import Foundation
import Combine

class ShowsViewModel {
    
    private let mediaRepository: MediaRepository
    
    let shows: CurrentValueSubject<[Show], Never> = .init([])
    
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
    func didSelectShow(at index: Int) {
        let show = shows.value[index]
        
    }
    private func fetchData() async {
        guard currentPage < maxPageCount else { return }
        currentPage += 1
        do {
            let response = try await mediaRepository.discoverShows(page: currentPage)
            maxPageCount = response.totalPages
            var currentValue = shows.value
            currentValue.append(contentsOf: response.results)
            shows.send(currentValue)
        } catch {
            self.error.send(error)
        }
    }
}

