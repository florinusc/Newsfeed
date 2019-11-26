//
//  UIImageView+Extension.swift
//  Newsfeed
//
//  Created by Florin Uscatu on 22/11/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    func setImage(_ stringUrl: String?, placeholderImage: UIImage? = nil) {
        guard let stringUrl = stringUrl, let url = URL(string: stringUrl) else {
            self.image = placeholderImage
            return
        }
        self.kf.setImage(with: url, placeholder: placeholderImage)
    }
}
