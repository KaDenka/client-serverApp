//
//  GroupsDataStorage.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 11.04.2021.
//

import UIKit

class GroupsDataStorage: NSObject {
    
    static let shared = GroupsDataStorage()
    
    private override init() {
        super.init()
    }
    
    var userGroupsArray = [Group]()
    var globalGroupsArray = [Group]()
    
    func firstLoadUsersGroupList() {
        GroupsDataStorage.shared.userGroupsArray = [
            Group(name: "Sport", avatar: UIImage(named: "sportGroupAvatar")),
            Group(name: "Movies", avatar: UIImage(named: "moviesGroupAvatar")),
            Group(name: "iOs", avatar: nil)
        ]
        
    }
    
    func firstLoadGlobalGroupList() {
        GroupsDataStorage.shared.globalGroupsArray = [
            Group(name: "Cats", avatar: nil),
            Group(name: "Bikes", avatar: nil),
            Group(name: "SwiftUI", avatar: UIImage(named: "swiftUIGroupAvatar")),
            Group(name: "Football", avatar: nil),
            Group(name: "Hockey", avatar: nil),
            Group(name: "SwiftCommunity", avatar: nil),
            Group(name: "Cartoons", avatar: nil)
        ]
        
    }
}
