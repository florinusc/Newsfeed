//
//  OnlineRepository.swift
//  Newsfeed
//
//  Created by Florin Uscatu on 23/11/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

class OnlineRepository: Repository {
    func getArticles(page: Int, _ block: @escaping (Result<Articles, Error>) -> Void) {
        SessionManager.shared.request(type: ArticlesResource.self, requestType: .topHeadlines(page: page)) { (result) in
            switch result {
            case .failure(let error):
                block(Swift.Result.failure(error))
            case .success(let resource):
                let articles = Articles.from(resource)
                block(Swift.Result.success(articles))
            }
        }
    }
}
