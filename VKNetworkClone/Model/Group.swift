//
//  Group.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 11.04.2021.
//

import UIKit

class Group: NSObject {

    let name: String
    var avatar: UIImage?
    
    init(name: String, avatar: UIImage?) {
        self.name = name
        self.avatar = avatar
    }
}
