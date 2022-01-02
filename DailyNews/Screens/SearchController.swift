//
//  SearchController.swift
//  DailyNews
//
//  Created by Viet Anh on 02/01/2022.
//

import UIKit

class SearchController: UIViewController {
    
    @IBAction func submit(_ sender: Any) {
        let searchResultVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchResultsController") as! SearchResultsController
        self.navigationController?.pushViewController(searchResultVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Search"
        
    }
    
}
