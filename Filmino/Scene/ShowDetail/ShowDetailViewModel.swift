//
//  ShowDetailViewModel.swift
//  Filmino
//
//  Created by Furkan Açıkgöz on 9.07.2024.
//

import Foundation
import Combine

class ShowDetailViewModel {
    
    private let mediaRepository: MediaRepository
    private let id: Int
    
    let data = PassthroughSubject<Show, Never>()
    
    init(mediaRepository: MediaRepository, showId: Int) {
        self.mediaRepository = mediaRepository
        self.id = showId
    }
    
    func start () {
        Task {
            await fetchData()
        }
    }
    private func fetchData () async {
        do {
            let details = try await mediaRepository.detailsOfShow(with: id)
            data.send(details)
            
        } catch {
            print(error)
        }
    }
}


