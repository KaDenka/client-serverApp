//
//  NewsTableViewCell.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 25.04.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var newsText: UILabel!
    
    @IBOutlet weak var newsImage: UIImageView!
    
    @IBOutlet weak var likesPanelView: UIStackView!
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var commentButton: UIButton!
    
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var viewsPanelView: UIStackView!
    
    @IBOutlet weak var viewsCountLabel: UILabel!
    
    @IBOutlet weak var viewsCountButton: UIButton!
    
    func clearCell() {
        userName.text = nil
        newsText.text = nil
        newsImage.image = nil
        viewsCountLabel = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clearCell()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        clearCell()
    }
    
    func configNewsCell(index: IndexPath) {
        userName.text = NewsDataStorage.shared.newsArray[index.row].userName
        newsText.text = NewsDataStorage.shared.newsArray[index.row].newsText
        if let newsPhoto = NewsDataStorage.shared.newsArray[index.row].newsPhoto {
            newsImage.image = newsPhoto
        } else {
            newsImage.image = nil
        }
        
        
    }
    
}
