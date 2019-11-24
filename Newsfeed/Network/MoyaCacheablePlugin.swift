//
//  MoyaCacheablePlugin.swift
//  Newsfeed
//
//  Created by Florin Uscatu on 24/11/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation
import Moya

final class MoyaCacheablePlugin: PluginType {
  func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
    if let moyaCachableProtocol = target as? MoyaCacheable {
      var cachableRequest = request
      cachableRequest.cachePolicy = moyaCachableProtocol.cachePolicy
      return cachableRequest
    }
    return request
  }
}
