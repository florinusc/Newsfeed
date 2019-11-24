//
//  ArticlesResource.swift
//  Newsfeed
//
//  Created by Florin Uscatu on 24/11/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

struct ArticlesResource: Codable {
    let totalResults: Int
    let articles: [ArticleResource]
}
