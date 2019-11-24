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
    var onFetchCompleted: ((Error?) -> Void) = {_ in}
    
    // MARK: - Private variables
    private var articles = [Article]()
    private var newsFeedCellViewModels = [NewsFeedCellViewModel]()
    private var currentPage = 1
    private var isFetchingArticles = false
    private var totalNumberOfArticles = 0
    private var maxNumberOfPages: Int {
        if totalNumberOfArticles == 0 { return 1 }
        return Int((Double(totalNumberOfArticles) / Double(Constants.articlesPerPage)).rounded(.up))
    }
    
    // MARK: - Lifecycle
    init(repository: Repository) {
        self.repository = repository
    }
    
    // MARK: - Public functions
    func getData(for indexPaths: [IndexPath]? = nil) {
        if let indexPaths = indexPaths {
            let indexes = indexPaths.map { $0.item }.sorted()
            if ((indexes.last ?? 0) + 1) < articles.count { return }
        }
        guard !isFetchingArticles, currentPage <= maxNumberOfPages else { return }
        isFetchingArticles = true
        repository.getArticles(page: currentPage) { [weak self] result in
            guard let self = self else { return }
            self.isFetchingArticles = false
            switch result {
            case .failure(let error):
                self.onFetchCompleted(error)
            case .success(let articles):
                self.totalNumberOfArticles = articles.total
                self.articles.append(contentsOf: articles.items)
                self.processNewsFeedCellViewModels()
                self.currentPage += 1
                self.onFetchCompleted(nil)
            }
        }
    }
    
    func newsFeedCellViewModel(at indexPath: IndexPath) -> NewsFeedCellViewModel? {
        guard indexPath.row >= 0, indexPath.row < numberOfArticles else { return nil }
        return newsFeedCellViewModels[indexPath.row]
    }
    
    func articleWebViewModel(at indexPath: IndexPath) -> ArticleWebViewModel? {
        guard indexPath.row >= 0, indexPath.row < numberOfArticles else { return nil }
        return ArticleWebViewModel(urlString: articles[indexPath.row].urlString)
    }
    
    // MARK: - Private functions
    private func processNewsFeedCellViewModels() {
        newsFeedCellViewModels = articles.enumerated().map { (index, article) -> NewsFeedCellViewModel in
            return NewsFeedCellViewModel.from(article, isFullWidth: index % self.wideArticleIndex == 0)
        }
    }
}
