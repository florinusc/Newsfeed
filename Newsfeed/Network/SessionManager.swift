//
//  SessionManager.swift
//  Newsfeed
//
//  Created by Florin Uscatu on 23/11/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation
import Moya

class SessionManager {
    
    static let shared = SessionManager()
    
    private init() {}
    
    func request<T: Codable>(type _: T.Type, requestType: RequestType, completion handler: @escaping (Result<T, Error>) -> Void) {
        let provider = MoyaProvider<RequestType>()
        provider.request(requestType) { result in
            switch result {
            case let .success(response):
                do {
                    let json = try JSONDecoder().decode(T.self, from: response.data)
                    handler(Swift.Result.success(json))
                } catch let error {
                    handler(Swift.Result.failure(error))
                    return
                }
            case let .failure(error):
                handler(Swift.Result.failure(error))
            }
        }
    }
}
