//
//  News.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 25.04.2021.
//

import UIKit

class News: NSObject {
    let userName: String
    let newsText: String
    var newsPhoto: UIImage?
    
    init(userName: String, newsText: String, newsPhoto: UIImage?) {
        self.userName = userName
        self.newsText = newsText
        self.newsPhoto = newsPhoto
    }

}
