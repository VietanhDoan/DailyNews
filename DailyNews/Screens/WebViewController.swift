//
//  WebViewController.swift
//  DailyNews
//
//  Created by Viet Anh on 03/01/2022.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webViewNews: WKWebView!
    
    var urlNews = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webViewNews.load(NSURLRequest(url: NSURL(string: urlNews)! as URL) as URLRequest)
    }
}
