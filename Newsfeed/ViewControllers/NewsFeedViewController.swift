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
    private let sidePadding: CGFloat = 15.0
    private let cellSpacing: CGFloat = 15.0
    private let cellHeight: CGFloat = 220.0
    
    // MARK: - Public variables
    var viewModel: NewsFeedViewModel! {
        didSet { viewModel.onFetchCompleted = onFetchCompleted }
    }
    
    // MARK: - Private variables
    private var numberOfCellsPerRow: Int {
        if UIDevice.current.orientation.isLandscape { return 3 }
        return 2
    }
    private var loadingView: LoadingView?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.reloadData()
    }
    
    // MARK: - Private functions
    private func setup() {
        setupLoader()
        setupCollectionView()
        showLoader()
        viewModel.getData()
    }
    
    private func onFetchCompleted(error: Error?) {
        self.hideLoader()
        if let error = error {
            self.presentAlert(for: error)
            return
        }
        self.collectionView.reloadData()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(NewsFeedCell.self)
    }
    
    private func setupLoader() {
        loadingView = .fromNib()
        loadingView?.isHidden = true
        loadingView?.frame = UIScreen.main.bounds
        guard let loadingView = loadingView else { return }
        view.addSubview(loadingView)
    }
    
    private func showLoader() {
        loadingView?.isHidden = false
    }
    
    private func hideLoader() {
        loadingView?.isHidden = true
    }
    
    private func openWebView(from indexPath: IndexPath) {
        guard let articleWebViewModel = viewModel.articleWebViewModel(at: indexPath) else {
            presentAlert(for: CustomError.generalError)
            return
        }
        let articleWebViewController = ArticleWebViewController.instantiate(with: articleWebViewModel)
        present(articleWebViewController, animated: true, completion: nil)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        openWebView(from: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: sidePadding, left: sidePadding, bottom: sidePadding, right: sidePadding)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxWidth = collectionView.frame.width - 2 * sidePadding
        let normalWidth = ((maxWidth - (cellSpacing * CGFloat(numberOfCellsPerRow - 1)).rounded(.up)) / CGFloat(numberOfCellsPerRow)).rounded(.down)
        if let newsFeedCellViewModel = viewModel.newsFeedCellViewModel(at: indexPath), newsFeedCellViewModel.isFullWidth {
            return CGSize(width: maxWidth, height: cellHeight)
        }
        return CGSize(width: normalWidth, height: cellHeight)
    }
}

extension NewsFeedViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        viewModel.getData(for: indexPaths)
    }
}

extension NewsFeedViewController: Storyboarded, ViewModelBased {
    static var storyboardName: Storyboards { return .main }
}
