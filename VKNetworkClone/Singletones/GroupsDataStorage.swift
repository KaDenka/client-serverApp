//
//  GroupsDataStorage.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 11.04.2021.
//

import UIKit
import Foundation

final class GroupsDataStorage {
    
    static let shared = GroupsDataStorage()
    
    private init() {}
    
    var userGroupsArray = [Group]()
    var globalGroupsArray = [Group]()
    
    func firstLoadUsersGroupList() {
       
        
    }
    
    func firstLoadGlobalGroupList() {
       
    }
}
