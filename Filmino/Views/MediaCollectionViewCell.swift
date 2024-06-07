//
//  MediaCollectionViewCell.swift
//  Filmino
//
//  Created by Ömer Faruk Gökce on 17.05.2024.
//

import UIKit
import Kingfisher

class MediaCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var posterView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 8
        containerView.clipsToBounds = true
    }
    
    func setup(with movie: Movie) {
        setup(title: movie.title, posterPath: movie.posterPath)
    }
    
    func setup(with show: Show) {
        setup(title: show.name, posterPath: show.posterPath)
    }
    
    private func setup(title: String, posterPath: String?) {
        titleLabel.text = title
        if let posterPath {
            let posterUrl = ImageUrlProvider.w500.provideUrl(for: posterPath)
            posterView.kf.setImage(with: URL(string: posterUrl))
        }
    }
}
