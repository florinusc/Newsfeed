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
    private let wideCellIndex: Int = 7
    
    // MARK: - Public variables
    var viewModel: NewsFeedViewModel!
    
    // MARK: - Private variables
    private var numberOfCellsPerRow: Int {
        if UIDevice.current.orientation.isLandscape { return 3 }
        return 2
    }
}

extension NewsFeedViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item % wideCellIndex == 0 {
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
