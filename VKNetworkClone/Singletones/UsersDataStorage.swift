//
//  UsersDataStorage.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 11.04.2021.
//

import UIKit
import Foundation

final class UsersDataStorage {
    
    static let shared = UsersDataStorage()
    
    private init() {}
    
    var usersArray = [User]()
    
    func firstLoadFriendList() {
        
      //  UsersDataStorage.shared.usersArray
        
        UsersDataStorage.shared.usersArray.sort{ $0.lastName < $1.lastName }
        
    }
}

