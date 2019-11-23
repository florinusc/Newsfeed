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
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var imageViewHeightRatio: NSLayoutConstraint!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var sourceLabel: UILabel!
    @IBOutlet private weak var timeStampLabel: UILabel!
    
    // MARK - Public functions
    func setup(with viewModel: NewsFeedCellViewModel) {
        imageView.setImage(viewModel.imageUrl)
//        if viewModel.isFullWidth, let newHeightRatioConstraint = imageViewHeightRatio.constraintWithMultiplier(0.5) {
//            imageView.removeConstraint(imageViewHeightRatio)
//            imageView.addConstraint(newHeightRatioConstraint)
//            layoutIfNeeded()
//            imageViewHeightRatio = newHeightRatioConstraint
//        }
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.descriptionText
        sourceLabel.text = viewModel.sourceText
        timeStampLabel.text = viewModel.publishText
    }

}
