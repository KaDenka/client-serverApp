//
//  User.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 11.04.2021.
//

import UIKit

class User: NSObject {
    let lastName: String
    let firstName: String
    var fullName: String {
        lastName + " " + firstName
    }
    var age: Int?
    var avatar: UIImage?
    var photoArray: [UIImage]?
    
    init(lastName: String, firstName: String, age: Int?, avatar: UIImage?, photoArray: [UIImage]?) {
        self.lastName = lastName
        self.firstName = firstName
        self.age = age
        self.avatar = avatar
        self.photoArray = photoArray
    }

}
