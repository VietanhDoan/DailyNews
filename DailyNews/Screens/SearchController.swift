//
//  SearchController.swift
//  DailyNews
//
//  Created by Viet Anh on 02/01/2022.
//

import UIKit

class SearchController: UIViewController {
    
    @IBOutlet weak var buttonSubmit: UIButton!
    @IBOutlet weak var textViewKeywords: UITextView!
    @IBOutlet weak var datePickerFrom: UIDatePicker!
    @IBOutlet weak var datePickerTo: UIDatePicker!
    
    @IBAction func submit(_ sender: Any) {
        if (textViewKeywords.text == "") {
            let alert = UIAlertController(title: "Cannot search", message: "Please input keyword to search news", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            return
        }
        
        let searchResultVC = self.storyboard?.instantiateViewController(withIdentifier: "NewsListController") as! NewsListController
        searchResultVC.keyword = textViewKeywords.text
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
