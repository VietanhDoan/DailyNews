//
//  HomeViewController.swift
//  DailyNews
//
//  Created by Viet Anh on 06/12/2021.
//

import UIKit
import Alamofire
import SDWebImage

class NewsListController: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    
    let cellReuseIdentifier = "NewsTableViewCell"
    var listNews : [Article] = []
    
    let apiKey = "8cda2c5ccb064475946211d4fb8523e7"
    
    let endpointSample = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=8cda2c5ccb064475946211d4fb8523e7"
    
    var category = ""
    var keyword = ""
    var fromDate = ""
    var toDate = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.navigationItem.title = category.capitalizingFirstLetter()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.89, green: 0.41, blue: 0.30, alpha: 1.00) // orange
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        newsTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
        newsTableView.delegate = self
        newsTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (category != "") {
            getNewsByCategories()
        } else {
            getNewsByKeywords()
        }
    }
    
    func getNewsByCategories() -> Void {
        let parameters = ["category": category, "country": "us", "apiKey": apiKey]
        
        AF.request("https://newsapi.org/v2/top-headlines", method: .get, parameters: parameters).debugLog().responseJSON { response in
            let data = response.data
            
            var newsResponse: NewsResponse
            if let contentType = response.response?.allHeaderFields["Content-Type"] as? String {
                if let _ = contentType.range(of: "application/json") {
                    do {
                        var json: Any? = nil
                        
                        if data!.count > 0 {
                            json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                        }
                        
                        if let jsonData = json as? [String: Any] {
                            newsResponse = NewsResponse(info: jsonData)
                            self.listNews = newsResponse.articles ?? []
                            self.newsTableView.reloadData()
                        }
                    } catch _ as NSError {
                        print("error")
                    }
                } else {
                    print("error")
                }
            }
        }
    }
    
    func getNewsByKeywords() -> Void {
        let parameters = ["q": keyword, "apiKey": apiKey]
        
        AF.request("https://newsapi.org/v2/everything", method: .get, parameters: parameters).debugLog().responseJSON { response in
            let data = response.data
            
            var newsResponse: NewsResponse
            if let contentType = response.response?.allHeaderFields["Content-Type"] as? String {
                if let _ = contentType.range(of: "application/json") {
                    do {
                        var json: Any? = nil
                        
                        if data!.count > 0 {
                            json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                        }
                        
                        if let jsonData = json as? [String: Any] {
                            newsResponse = NewsResponse(info: jsonData)
                            self.listNews = newsResponse.articles ?? []
                            self.newsTableView.reloadData()
                        }
                    } catch _ as NSError {
                        print("error")
                    }
                } else {
                    print("error")
                }
            }
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    

}


extension NewsListController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listNews.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! NewsTableViewCell
        cell.labelNewsTitle.text = self.listNews[indexPath.row].title
        
        var newsContent = self.listNews[indexPath.row].description
        if (newsContent == nil) {
            newsContent = self.listNews[indexPath.row].content
        }
        cell.labelNewsDescription.text = newsContent
        cell.imageViewNewsImage.sd_setImage(with: URL(string: self.listNews[indexPath.row].urlToImage ?? ""), completed: nil)
        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let newsDetailController = self.storyboard?.instantiateViewController(withIdentifier: "NewsDetailController") as! NewsDetailController
        let webViewController = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        let article = self.listNews[indexPath.row]
        webViewController.urlNews = article.url ?? ""
//        newsDetailController.article = article
        self.navigationController?.pushViewController(webViewController, animated: true)
    }

}
