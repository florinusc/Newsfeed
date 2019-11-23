//
//  ArticleWebViewModel.swift
//  Newsfeed
//
//  Created by Florin Uscatu on 23/11/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

struct ArticleWebViewModel: ViewModel {
    
    // MARK: - Private constants
    private let urlString: String
    
    // MARK: - Public variables
    var request: URLRequest? {
        guard let url = URL(string: urlString) else { return nil }
        return URLRequest(url: url)
    }
    
    // MARK: - Lifecycle
    init(urlString: String) {
        self.urlString = urlString
    }
}
