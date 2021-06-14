//
//  User.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 11.04.2021.
//

import UIKit
import Foundation

class User: Decodable {
    
    var lastName: String = ""
    var firstName: String = ""
    
    var avatar: String?
    var fullName: String { lastName + " " + firstName }
    
    enum CodingKeys: String, CodingKey {
        case lastName = "last_name"
        case firstName = "first_name"
        case avatar = "photo_50"
    }
    
    convenience required init(from decoder: Decoder) throws {
        try self.init(from: decoder)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.lastName = try values.decode(String.self, forKey: .lastName)
        self.firstName = try values.decode(String.self, forKey: .firstName)
        self.avatar = try values.decode(String.self, forKey: .avatar)
    }
    
//    init(lastName: String, firstName: String, avatar: String?) {
//        self.lastName = lastName
//        self.firstName = firstName
//        self.avatar = avatar
//    }
    
}
