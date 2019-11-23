//
//  DateHelper.swift
//  Newsfeed
//
//  Created by Florin Uscatu on 23/11/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

class DateHelper {
    
    static let shared = DateHelper()
    
    private init() {}
    
    func date(from dateString: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter.date(from: dateString)
    }
    
    func time(since date: Date) -> String? {
        let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.allowedUnits = [.hour]
        dateComponentsFormatter.unitsStyle = .abbreviated
        return dateComponentsFormatter.string(from: date, to: Date())
    }
}
