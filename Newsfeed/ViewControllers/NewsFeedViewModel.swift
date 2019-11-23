//
//  NewsFeedViewModel.swift
//  Newsfeed
//
//  Created by Florin Uscatu on 22/11/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

class NewsFeedViewModel: ViewModel {
    
    // MARK: - Private constants
    private let repository: Repository
    private let wideArticleIndex: Int = 7
    
    // MARK: - Public variables
    var numberOfArticles: Int {
        return newsFeedCellViewModels.count
    }
    
    // MARK: - Private variables
    private var newsFeedCellViewModels = [NewsFeedCellViewModel]()
    
    // MARK: - Lifecycle
    init(repository: Repository) {
        self.repository = repository
    }
    
    // MARK: - Public functions
    func getData(_ block: @escaping (Error?) -> Void) {
        repository.getArticles { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                block(error)
            case .success(let articles):
                self.newsFeedCellViewModels = articles.enumerated().map { (index, article) -> NewsFeedCellViewModel in
                    return NewsFeedCellViewModel.from(article, isFullWidth: index % self.wideArticleIndex == 0)
                }
                block(nil)
            }
        }
    }
    
    func newsFeedCellViewModel(at indexPath: IndexPath) -> NewsFeedCellViewModel? {
        guard indexPath.row >= 0, indexPath.row < numberOfArticles else { return nil }
        return newsFeedCellViewModels[indexPath.row]
    }
}
