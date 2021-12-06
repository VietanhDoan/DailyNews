//
//  HomeViewController.swift
//  DailyNews
//
//  Created by Viet Anh on 06/12/2021.
//

import UIKit
import Alamofire
import SDWebImage

class HomeViewController: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    
    let animals: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat"]
    let cellReuseIdentifier = "NewsTableViewCell"
    var listNews : [Article] = []
    
    let endpointSample = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=8cda2c5ccb064475946211d4fb8523e7"
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        newsTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
        newsTableView.delegate = self
        newsTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        let parameters = ["q": "bitcoin", "apiKey": "8cda2c5ccb064475946211d4fb8523e7"]
        
        AF.request("https://newsapi.org/v2/everything", method: .get, parameters: parameters).responseJSON { response in
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
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    

}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listNews.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! NewsTableViewCell
        cell.labelNewsTitle.text = self.listNews[indexPath.row].title
        cell.labelNewsDescription.text = self.listNews[indexPath.row].description
        cell.imageViewNewsImage.sd_setImage(with: URL(string: self.listNews[indexPath.row].urlToImage ?? ""), completed: nil)
        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsDetailController = self.storyboard?.instantiateViewController(withIdentifier: "NewsDetailController") as! NewsDetailController
        let article = self.listNews[indexPath.row]
        newsDetailController.article = article
        self.navigationController?.pushViewController(newsDetailController, animated: true)
    }

}
