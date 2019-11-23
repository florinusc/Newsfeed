//
//  ArticleWebViewController.swift
//  Newsfeed
//
//  Created by Florin Uscatu on 23/11/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit
import WebKit

class ArticleWebViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var webView: WKWebView!
    
    // MARK: - Public variables
    var viewModel: ArticleWebViewModel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private functions
    private func setup() {
        guard let request = viewModel.request else { return }
        webView.load(request)
    }
    
    // MARK: - IBActions
    @IBAction private func didTapCloseButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension ArticleWebViewController: Storyboarded, ViewModelBased {
    static var storyboardName: Storyboards { return .main }
}
