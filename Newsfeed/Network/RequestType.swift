//
//  RequestType.swift
//  Newsfeed
//
//  Created by Florin Uscatu on 23/11/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation
import Moya
import Alamofire

enum RequestType: TargetType {
    
    case topHeadlines(page: Int)
    
    var baseURL: URL {
        return URL(string: Constants.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .topHeadlines: return "top-headlines"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case let .topHeadlines(page): return .requestParameters(parameters: ["apiKey": Constants.apiKey,
                                                                             "country": "us",
                                                                             "pageSize": Constants.articlesPerPage,
                                                                             "page": page], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}

extension RequestType: MoyaCacheable {
    
    func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    var cachePolicy: Self.MoyaCacheablePolicy {
        return isConnectedToInternet() ? .reloadIgnoringCacheData : .returnCacheDataDontLoad
    }
}
