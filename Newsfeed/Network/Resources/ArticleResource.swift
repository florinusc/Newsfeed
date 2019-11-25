//
//  ArticleResource.swift
//  Newsfeed
//
//  Created by Florin Uscatu on 24/11/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

struct ArticleResource: Codable {
    struct SourceResource: Codable {
        let id: String?
        let name: String
    }
    
    let source: SourceResource
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}
