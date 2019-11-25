//
//  NewsFeedViewModelTests.swift
//  NewsfeedTests
//
//  Created by Florin Uscatu on 25/11/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import XCTest
@testable import Newsfeed

class NewsFeedViewModelTests: XCTestCase {
    
    var viewModel: NewsFeedViewModel!
    var error: Error?
    
    func onFetchCompleted(error: Error?) {
        self.error = error
    }
    
    func test_getDataWithError_returnsError_successful() {
        viewModel = NewsFeedViewModel(repository: MockRepository(shouldReturnError: true))
        viewModel.onFetchCompleted = onFetchCompleted(error:)
        viewModel.getData()
        XCTAssertNotNil(error)
    }
    
    func test_getDataWithoutError_returnsNilError_successful() {
        viewModel = NewsFeedViewModel(repository: MockRepository())
        viewModel.onFetchCompleted = onFetchCompleted(error:)
        viewModel.getData()
        XCTAssertNil(error)
    }
    
    func test_numberOfArticlesIsCorrect_is38_successful() {
        viewModel = NewsFeedViewModel(repository: MockRepository())
        viewModel.getData()
        XCTAssertEqual(viewModel.numberOfArticles, 20)
    }
    
    func test_newsFeedCellViewModelAtValidIndexPath_isNotNil_successful() {
        viewModel = NewsFeedViewModel(repository: MockRepository())
        viewModel.getData()
        XCTAssertNotNil(viewModel.newsFeedCellViewModel(at: IndexPath(item: 5, section: 0)))
    }
    
    func test_newsFeedCellViewModelAtInvalidIndexPath_isNil_fail() {
        viewModel = NewsFeedViewModel(repository: MockRepository())
        viewModel.getData()
        XCTAssertNil(viewModel.newsFeedCellViewModel(at: IndexPath(item: 25, section: 0)))
    }
    
    func test_articleWebViewModelAtValidIndexPath_isNotNil_successful() {
        viewModel = NewsFeedViewModel(repository: MockRepository())
        viewModel.getData()
        XCTAssertNotNil(viewModel.articleWebViewModel(at: IndexPath(item: 3, section: 0)))
    }
    
    func test_articleWebViewModelAtInvalidIndexPath_isNil_fail() {
        viewModel = NewsFeedViewModel(repository: MockRepository())
        viewModel.getData()
        XCTAssertNil(viewModel.articleWebViewModel(at: IndexPath(item: 55, section: 0)))
    }
    
}
