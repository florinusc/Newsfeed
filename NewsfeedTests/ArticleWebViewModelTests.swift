//
//  ArticleWebViewModelTests.swift
//  NewsfeedTests
//
//  Created by Florin Uscatu on 25/11/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import XCTest
@testable import Newsfeed

class ArticleWebViewModelTests: XCTestCase {

    var viewModel: ArticleWebViewModel!
    
    func test_requestIsNotNil_withValidUrl_successful() {
        viewModel = ArticleWebViewModel(urlString: "www.google.com")
        XCTAssertNotNil(viewModel.request)
    }

    func test_requestIsNil_withInvalidUrl_fail() {
        viewModel = ArticleWebViewModel(urlString: "")
        XCTAssertNil(viewModel.request)
    }
    
}
