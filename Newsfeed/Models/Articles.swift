//
//  Articles.swift
//  Newsfeed
//
//  Created by Florin Uscatu on 24/11/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

struct Articles {
    var total: Int
    var items: [Article]
    
    static func from(_ resource: ArticlesResource) -> Articles {
        return Articles(total: resource.totalResults, items: resource.articles.map({ Article.from($0) }))
    }
}
