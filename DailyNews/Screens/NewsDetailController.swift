//
//  NewsDetailController.swift
//  DailyNews
//
//  Created by Viet Anh on 06/12/2021.
//

import UIKit

class NewsDetailController: UIViewController {
    @IBOutlet weak var imageViewImage: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelContent: UILabel!
    
    var article: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTitle.text = article?.title
        labelContent.text = article?.content
        imageViewImage.sd_setImage(with: URL(string: article?.urlToImage ?? ""), completed: nil)
    }
}
