//
//  NewsCategoriesController.swift
//  DailyNews
//
//  Created by Viet Anh on 02/01/2022.
//

import UIKit

class NewsCategoriesController: UIViewController {
    
    @IBOutlet weak var searchButton: UIImageView!
    @IBOutlet weak var collectionNewsCategories: UICollectionView!
    
    let categories = ["business", "entertainment", "health", "science", "sports", "technology"]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            searchButton.isUserInteractionEnabled = true
            searchButton.addGestureRecognizer(tapGestureRecognizer)
        
        collectionNewsCategories.delegate = self
        collectionNewsCategories.dataSource = self
        collectionNewsCategories.register(UINib(nibName: "NewsCategoryCell", bundle: nil), forCellWithReuseIdentifier: "NewsCategoryCell")
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
//        let tappedImage = tapGestureRecognizer.view as! UIImageView
        let searchVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchController") as! SearchController
        self.navigationController?.pushViewController(searchVC, animated: true)
        // Your action
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

extension NewsCategoriesController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : NewsCategoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCategoryCell", for: indexPath) as! NewsCategoryCell
        cell.categoryTitle.text = categories[indexPath.row].capitalizingFirstLetter()
        cell.categoryImage.image = UIImage(named: categories[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let newsListVC = self.storyboard?.instantiateViewController(withIdentifier: "NewsListController") as! NewsController
        newsListVC.category = categories[indexPath.row]
        self.navigationController?.pushViewController(newsListVC, animated: true)
    }
    
    
}

extension NewsCategoriesController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let cellSize : CGFloat = (screenWidth) / 2.0
        return CGSize(width: cellSize, height: cellSize + 25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 0, bottom: 6, right: 0)
    }
}
