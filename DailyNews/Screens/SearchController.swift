//
//  SearchController.swift
//  DailyNews
//
//  Created by Viet Anh on 02/01/2022.
//

import UIKit

class SearchController: UIViewController {
    
    @IBOutlet weak var buttonSubmit: UIButton!
    
    @IBAction func submit(_ sender: Any) {
        let searchResultVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchResultsController") as! SearchResultsController
        self.navigationController?.pushViewController(searchResultVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Search"
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.89, green: 0.41, blue: 0.30, alpha: 1.00) // orange
        
        buttonSubmit.backgroundColor = UIColor(red: 0.85, green: 0.51, blue: 0.42, alpha: 1.00)
        buttonSubmit.layer.cornerRadius = 5
        buttonSubmit.tintColor = UIColor.white
    }
    
}
