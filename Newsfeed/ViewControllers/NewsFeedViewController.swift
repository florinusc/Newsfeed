//
//  ViewController.swift
//  Newsfeed
//
//  Created by Florin Uscatu on 22/11/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Private constants
    private let cellHeight: CGFloat = 100.0
    
    // MARK: - Public variables
    var viewModel: NewsFeedViewModel!
    
    // MARK: - Private variables
    private var numberOfCellsPerRow: Int {
        if UIDevice.current.orientation.isLandscape { return 3 }
        return 2
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        setup()
    }
    
    // MARK: - Private functions
    private func setup() {
        viewModel.getData { [weak self] (error) in
            guard let self = self else { return }
            if let error = error {
                self.presentAlert(for: error)
                return
            }
            self.collectionView.reloadData()
        }
    }
}

extension NewsFeedViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfArticles
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let newsFeedCellViewModel = viewModel.newsFeedCellViewModel(at: indexPath), newsFeedCellViewModel.isFullWidth {
            let width = collectionView.frame.width
            return CGSize(width: width, height: cellHeight)
        }
        let width = collectionView.frame.width / CGFloat(numberOfCellsPerRow)
        return CGSize(width: width, height: cellHeight)
    }
}

extension NewsFeedViewController: Storyboarded, ViewModelBased {
    static var storyboardName: Storyboards { return .main }
}
