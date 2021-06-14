//
//  Photo.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 03.06.2021.
//

import Foundation
import UIKit

class Photo {
    
    let userID: String?
    var photo: UIImage?
    
    init (userID: String?, photo: UIImage?) {
        self.userID = userID
        self.photo = photo
    }
    
}
