//
//  NewsTableViewCell.swift
//  DailyNews
//
//  Created by Viet Anh on 06/12/2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var labelNewsDescription: UILabel!
    @IBOutlet weak var imageViewNewsImage: UIImageView!
    @IBOutlet weak var labelNewsTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
