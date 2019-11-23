//
//  Repository.swift
//  Newsfeed
//
//  Created by Florin Uscatu on 23/11/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

protocol Repository {
    func getArticles(_ block: @escaping (Result<[Article], Error>) -> Void)
}
