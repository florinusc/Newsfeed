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
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private functions
    private func setup() {
        setupCollectionView()
        viewModel.getData { [weak self] (error) in
            guard let self = self else { return }
            if let error = error {
                self.presentAlert(for: error)
                return
            }
            self.collectionView.reloadData()
        }
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(NewsFeedCell.self)
    }
}

extension NewsFeedViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfArticles
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: NewsFeedCell = collectionView.dequeueReusableCell(for: indexPath)
        if let cellViewModel = viewModel.newsFeedCellViewModel(at: indexPath) {
            cell.setup(with: cellViewModel)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15.0, left: 15.0, bottom: 35.0, right: 15.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxWidth = UIScreen.main.bounds.width - 45.0
        if let newsFeedCellViewModel = viewModel.newsFeedCellViewModel(at: indexPath), newsFeedCellViewModel.isFullWidth {
            let width = maxWidth + 15.0
            return CGSize(width: width, height: maxWidth / 2)
        }
        let width = maxWidth / CGFloat(numberOfCellsPerRow)
        return CGSize(width: width, height: width * 1.5)
    }
}

extension NewsFeedViewController: Storyboarded, ViewModelBased {
    static var storyboardName: Storyboards { return .main }
}
