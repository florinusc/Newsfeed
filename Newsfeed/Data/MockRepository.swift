//
//  MockRepository.swift
//  Newsfeed
//
//  Created by Florin Uscatu on 23/11/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

class MockRepository: Repository {
    
    private let shouldReturnError: Bool
    
    init(shouldReturnError: Bool = false) {
        self.shouldReturnError = shouldReturnError
    }
    
    func getArticles(_ block: @escaping (Result<[Article], Error>) -> Void) {
        if shouldReturnError {
            block(Result.failure(CustomError.generalError))
            return
        }
        
        block(Result.success([Article.makeFirstMock(), Article.makeSecondMock(), Article.makeThirdMock(), Article.makeFourthMock(), Article.makeFirstMock(), Article.makeSecondMock(), Article.makeThirdMock(), Article.makeFourthMock(), Article.makeFirstMock(), Article.makeSecondMock(), Article.makeThirdMock(), Article.makeFourthMock(), Article.makeFirstMock(), Article.makeSecondMock(), Article.makeThirdMock(), Article.makeFourthMock(), Article.makeFirstMock(), Article.makeSecondMock(), Article.makeThirdMock(), Article.makeFourthMock()]))
        
    }
}
