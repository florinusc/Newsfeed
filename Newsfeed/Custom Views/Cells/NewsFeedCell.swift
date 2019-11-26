//
//  NewsFeedCell.swift
//  Newsfeed
//
//  Created by Florin Uscatu on 22/11/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

class NewsFeedCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var articleImageView: UIImageView!
    @IBOutlet private weak var articleImageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var sourceLabel: UILabel!
    @IBOutlet private weak var timeStampLabel: UILabel!
    
    // MARK - Public functions
    func setup(with viewModel: NewsFeedCellViewModel) {
        let placeholderImage = UIImage(named: "newsPlaceholder")
        articleImageView.setImage(viewModel.imageUrl, placeholderImage: placeholderImage)
        articleImageViewHeightConstraint.constant = viewModel.isFullWidth ? 110.0 : 145.0
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.descriptionText
        sourceLabel.text = viewModel.sourceText
        timeStampLabel.text = viewModel.publishText
    }
    
    // MARK: - Lifecycle
    override func prepareForReuse() {
        super.prepareForReuse()
        articleImageView.image = nil
    }
}
