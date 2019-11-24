//
//  UIViewController+Extension.swift
//  Newsfeed
//
//  Created by Florin Uscatu on 23/11/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        okAction.setValue(UIColor.black, forKey: "titleTextColor")
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func presentAlert(with title: String, message: String, actionMessage: String, action: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let customAction = UIAlertAction(title: actionMessage, style: .default) { _ in
            action()
        }
        customAction.setValue(UIColor.black, forKey: "titleTextColor")
        alert.addAction(customAction)
        present(alert, animated: true, completion: nil)
    }
    
    func presentAlert(for error: Error, retryAction: (() -> Void)? = nil) {
        if let retryAction = retryAction {
            presentAlert(with: "Error", message: error.localizedDescription, actionMessage: "Retry", action: retryAction)
            return
        }
        presentAlert(with: "Error", message: error.localizedDescription)
    }
}
