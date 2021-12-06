//
//  HomeViewController.swift
//  DailyNews
//
//  Created by Viet Anh on 06/12/2021.
//

import UIKit
import Alamofire

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

    

}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! NewsTableViewCell
        cell.labelNewsTitle.text = animals[indexPath.row]
        cell.imageViewNewsImage.image = UIImage(named: "Newspaper")
        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

}
