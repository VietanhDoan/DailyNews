//
//  NewsCategoryCell.swift
//  DailyNews
//
//  Created by Viet Anh on 02/01/2022.
//

import UIKit

class NewsCategoryCell: UICollectionViewCell {

    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        categoryImage.image = UIImage(named:"sports")
    }

}
