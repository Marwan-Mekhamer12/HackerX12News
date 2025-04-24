//
//  HackerData.swift
//  HackerX12News
//
//  Created by Marwan Mekhamer on 24/04/2025.
//

import UIKit
import WebKit

class HackerData: UIViewController {
    
    var urlstring: String?
    var webView: WKWebView!

    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let urlString = urlstring {
            let url = URL(string: urlString)!
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
}
