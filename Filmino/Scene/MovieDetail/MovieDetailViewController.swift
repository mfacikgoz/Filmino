//
//  MovieDetailViewController.swift
//  Filmino
//
//  Created by Furkan Açıkgöz on 9.07.2024.
//

import UIKit
import Combine
import Kingfisher

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    private var cancellables = Set<AnyCancellable>()
    
    var viewModel: MovieDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        
        viewModel?.data
            .receive(on: DispatchQueue.main)
            .sink { [weak self] data in
                self?.handle(data)
            }
            .store(in: &cancellables)
        
        viewModel?.start()
    }
    
    private func setupNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.tintColor = .black
        navigationItem.backButtonTitle = ""
    }
    
    private func handle(_ data: Movie) {
        if let backdropPath = data.backdropPath {
            let backdropUrl = ImageUrlProvider.w780.provideUrl(for: backdropPath)
            backdropImageView.kf.setImage(with: URL(string: backdropUrl))
        }
        titleLabel.text = data.title
        taglineLabel.text = data.tagline
        overviewLabel.text = data.overview
    }
}
