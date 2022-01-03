//
//  WebViewController.swift
//  DailyNews
//
//  Created by Viet Anh on 03/01/2022.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    
    var urlNews = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true

        let webViewNews = WKWebView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), configuration: configuration)

        view.addSubview(webViewNews)
        
        print("url: \(urlNews)")
        webViewNews.load(NSURLRequest(url: NSURL(string: urlNews)! as URL) as URLRequest)
    }
}
