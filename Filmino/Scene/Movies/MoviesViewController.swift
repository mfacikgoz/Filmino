//
//  MoviesViewController.swift
//  Filmino
//
//  Created by Furkan Açıkgöz on 7.06.2024.
//

import UIKit
import Combine
import CombineCocoa

class MoviesViewController: UIViewController {
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var cancellables = Set<AnyCancellable>()
    
    var viewModel: MoviesViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundView?.backgroundColor = .clear
        
        let cellNib = UINib(nibName: "\(MediaCollectionViewCell.self)", bundle: nil)
        
        collectionView.register(cellNib, forCellWithReuseIdentifier: "cell")
        
        viewModel?.movies
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.update()
            }
            .store(in: &cancellables)
        
        viewModel?.error
            .receive(on: DispatchQueue.main)
            .sink { [weak self] error in
                self?.show(error)
            }
            .store(in: &cancellables)
        
        viewModel?.start()
    }
    
    private func update() {
        collectionView.reloadData()
    }
    
    private func show(_ error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        present(alert, animated: true)
    }
}


extension MoviesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.movies.value.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModel else { return .init() }
        
        let data = viewModel.movies.value[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MediaCollectionViewCell
        
        cell?.setup(with: data)
        
        return cell ?? .init()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel?.didSelectMovie(at: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - (16 + 12 + 16)) / 2 // 16pts padding, 12 pts between
        let height = width * (750/500) + 50 // 500/750 poster aspect ratio, 50 pts for title area
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let viewModel else { return }
        if indexPath.row == viewModel.movies.value.count - 10 {
            viewModel.didScrollToBottom()
        }
    }
}
