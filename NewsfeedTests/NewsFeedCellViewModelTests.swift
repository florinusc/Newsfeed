//
//  NewsFeedCellViewModelTests.swift
//  NewsfeedTests
//
//  Created by Florin Uscatu on 25/11/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import XCTest
@testable import Newsfeed

class NewsFeedCellViewModelTests: XCTestCase {
    
    let viewModel = NewsFeedCellViewModel(article: Article.makeFirstMock(), isFullWidth: false)
    
    func test_isFullWidth_isFalse_successful() {
        XCTAssertFalse(viewModel.isFullWidth)
    }
    
    func test_title_isCorrect_successful() {
        XCTAssertEqual(viewModel.title, "Scooter Braun Tells Taylor Swift His Family's Death Threats Are Because of Her Attacks - TMZ")
    }
    
    func test_imageUrl_isNotNil_successful() {
        XCTAssertNotNil(viewModel.imageUrl)
    }
    
    func test_descriptionText_isDescription_successful() {
        XCTAssertEqual(viewModel.descriptionText, Article.makeFirstMock().description)
    }
    
    func test_sourceText_isCorrect_successful() {
        XCTAssertEqual(viewModel.sourceText, "From: Google News")
    }
}

