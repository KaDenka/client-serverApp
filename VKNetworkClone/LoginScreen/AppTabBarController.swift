//
//  AppTabBarController.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 07.04.2021.
//

import UIKit

class AppTabBarController: UITabBarController {
    
    let loadingActualUserInfo = GetInfoService()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadingActualUserInfo.getFriendsList()
        loadingActualUserInfo.getPhotoCollection()
        loadingActualUserInfo.getGroupsList()
        
        
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], for: .normal)
        
        self.tabBar.unselectedItemTintColor = UIColor.white
        
        UsersDataStorage.shared.firstLoadFriendList()
        GroupsDataStorage.shared.firstLoadUsersGroupList()
        GroupsDataStorage.shared.firstLoadGlobalGroupList()
        NewsDataStorage.shared.firstLoadNews()
    
    }

}
