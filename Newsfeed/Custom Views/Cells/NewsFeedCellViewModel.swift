//
//  NewsFeedCellViewModel.swift
//  Newsfeed
//
//  Created by Florin Uscatu on 22/11/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

struct NewsFeedCellViewModel: ViewModel {
    
    let isFullWidth: Bool
    let title: String
    let imageUrl: String?
    private let sourceName: String?
    private let description: String?
    private let content: String?
    private let publishDate: String
    
    var descriptionText: String? {
        return isFullWidth ? content : description
    }
    
    var sourceText: String {
        guard let sourceName = sourceName else { return "" }
        return "From: \(sourceName)"
    }
    
    var publishText: String {
        guard let date = DateHelper.shared.date(from: publishDate), let timeSince = DateHelper.shared.time(since: date) else { return "" }
        return "\(timeSince) ago"
    }
    
    static func from(_ article: Article, isFullWidth: Bool) -> NewsFeedCellViewModel {
        return NewsFeedCellViewModel(isFullWidth: isFullWidth,
                                     title: article.title,
                                     imageUrl: article.imageUrl,
                                     sourceName: article.sourceName,
                                     description: article.description,
                                     content: article.content,
                                     publishDate: article.publishDate)
    }
}
