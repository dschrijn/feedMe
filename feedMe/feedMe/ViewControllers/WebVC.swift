//
//  WebVC.swift
//  secondFeedrReader
//
//  Created by David A. Schrijn on 3/23/17.
//  Copyright © 2017 David A. Schrijn. All rights reserved.
//

import UIKit
import WebKit

class WebVC: UIViewController, WKUIDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var webView: UIWebView! // Deprecated!
    @IBOutlet weak var webViewContainer: UIView!
    
    // MARK: - Variables
    
    var articlesInfo: FeedrInfo!
    var wkWebView: WKWebView!
    
    // MARK: - App Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureWKView()
        if let url = URL(string:articlesInfo.pageUrl) {
            let request = NSURLRequest(url: url)
                wkWebView.load(request as URLRequest)
        }

    }
    
    // MARK: - Functions
    
    func configureWKView() {
        let webConfiguration = WKWebViewConfiguration()
        let customFrame = CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: 0.0, height: webViewContainer.frame.size.height))
        wkWebView = WKWebView(frame: customFrame, configuration: webConfiguration)
        wkWebView.translatesAutoresizingMaskIntoConstraints = false
        webViewContainer.addSubview(wkWebView)
        
        wkWebView.topAnchor.constraint(equalTo: webViewContainer.topAnchor).isActive = true
        wkWebView.bottomAnchor.constraint(equalTo: webViewContainer.bottomAnchor).isActive = true
        wkWebView.rightAnchor.constraint(equalTo: webViewContainer.rightAnchor).isActive = true
        wkWebView.leftAnchor.constraint(equalTo: webViewContainer.leftAnchor).isActive = true
        wkWebView.heightAnchor.constraint(equalTo: webViewContainer.heightAnchor).isActive = true
        wkWebView.uiDelegate = self
    }
    
    // MARK: - IBActions
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func newsAPIBtn(_ sender: Any) {
        if let url = NSURL(string: "https://newsapi.org/") {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
    
}
