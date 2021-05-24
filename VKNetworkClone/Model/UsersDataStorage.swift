//
//  UsersDataStorage.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 11.04.2021.
//

import UIKit

class UsersDataStorage: NSObject {
    
    static let shared = UsersDataStorage()
    
    private override init() {
        super.init()
    }
    
    var usersArray = [User]()
    
    func firstLoadFriendList() {
        UsersDataStorage.shared.usersArray = [
            User(lastName: "Ivanov", firstName: "Ivan", age: 24, avatar: UIImage(named: "ivanovAvatar"), photoArray: [UIImage(named: "ivanovPhotoOne")!, UIImage(named: "ivanovPhotoTwo")!, UIImage(named: "ivanovPhotoThree")!]),
            User(lastName: "Petrova", firstName: "Anna", age: 22, avatar: UIImage(named: "petrovaAvatar"), photoArray: [UIImage(named: "petrovaPhotoOne")!, UIImage(named: "petrovaPhotoTwo")!]),
            User(lastName: "Sidorov", firstName: "Alex", age: 48, avatar: nil, photoArray: nil),
            User(lastName: "Ahtungov", firstName: "Carl", age: 21, avatar: nil, photoArray: nil),
            User(lastName: "Ivanova", firstName: "Svetlana", age: 20, avatar: nil, photoArray: nil),
            User(lastName: "Kuvaev", firstName: "Sergey", age: 56, avatar: nil, photoArray: nil),
            User(lastName: "Bondarev", firstName: "Pavel", age: 11, avatar: nil, photoArray: nil),
            User(lastName: "Zapashnyj", firstName: "Askold", age: 45, avatar: nil, photoArray: nil),
            User(lastName: "Kozlova", firstName: "Svetlana", age: 43, avatar: nil, photoArray: nil),
            User(lastName: "Kozlov", firstName: "Sergey", age: 44, avatar: nil, photoArray: nil)
        ]
        
        UsersDataStorage.shared.usersArray.sort{ $0.lastName < $1.lastName }
        
    }
}

