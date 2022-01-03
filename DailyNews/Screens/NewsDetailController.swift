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
    
    @IBAction func seeMore(_ sender: Any) {
        let url = URL(string: article?.url ?? "")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTitle.text = article?.title
        labelContent.sizeToFit()
        imageViewImage.sd_setImage(with: URL(string: article?.urlToImage ?? ""), completed: nil)

        
        guard let articleContent = article?.content else {
            labelContent.text = article?.description
            return
        }
        labelContent.text = articleContent
    }
}
