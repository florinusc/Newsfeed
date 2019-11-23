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

    // MARK: - Private variables
    private var loadingView: LoadingView?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private functions
    private func setup() {
        setupLoader()
        webView.navigationDelegate = self
        guard let request = viewModel.request else { return }
        webView.load(request)
    }
    
    private func setupLoader() {
        loadingView = .fromNib()
        loadingView?.isHidden = true
        loadingView?.frame = CGRect.zero
        guard let loadingView = loadingView else { return }
        view.addSubview(loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.topAnchor.constraint(equalTo: webView.topAnchor).isActive = true
        loadingView.bottomAnchor.constraint(equalTo: webView.bottomAnchor).isActive = true
        loadingView.leftAnchor.constraint(equalTo: webView.leftAnchor).isActive = true
        loadingView.rightAnchor.constraint(equalTo: webView.rightAnchor).isActive = true
    }
    
    private func showLoader() {
        loadingView?.isHidden = false
    }
    
    private func hideLoader() {
        loadingView?.isHidden = true
    }
    
    // MARK: - IBActions
    @IBAction private func didTapCloseButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension ArticleWebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        showLoader()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        hideLoader()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        hideLoader()
    }
}

extension ArticleWebViewController: Storyboarded, ViewModelBased {
    static var storyboardName: Storyboards { return .main }
}
