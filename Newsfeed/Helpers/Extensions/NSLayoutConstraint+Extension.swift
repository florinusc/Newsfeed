//
//  NSLayoutConstraint+Extension.swift
//  Newsfeed
//
//  Created by Florin Uscatu on 22/11/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    // This part was taken from the following thread:
    // https://stackoverflow.com/a/37294619/4907287
    func constraintWithMultiplier(_ multiplier: CGFloat) -> NSLayoutConstraint? {
        guard let firstItem = firstItem else { return nil }
        return NSLayoutConstraint(item: firstItem, attribute: firstAttribute, relatedBy: relation, toItem: secondItem, attribute: secondAttribute, multiplier: multiplier, constant: constant)
    }
}
