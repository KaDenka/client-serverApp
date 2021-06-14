//
//  Group.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 11.04.2021.
//

import UIKit
import Foundation

class Group: Decodable {
    
    var name: String = ""
    var avatar: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case avatar = "photo_50"
    }
    
    convenience required init(from decoder: Decoder) throws {
        try self.init(from: decoder)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try values.decode(String.self, forKey: .name)
        self.avatar = try values.decode(String.self, forKey: .avatar)
    }
    
//    init(name: String, avatar: String?) {
//        self.name = name
//        self.avatar = avatar
//    }
}
