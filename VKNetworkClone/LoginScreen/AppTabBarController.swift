//
//  AppTabBarController.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 07.04.2021.
//

import UIKit

class AppTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], for: .normal)
        
        self.tabBar.unselectedItemTintColor = UIColor.white
        
        UsersDataStorage.shared.firstLoadFriendList()
        GroupsDataStorage.shared.firstLoadUsersGroupList()
        GroupsDataStorage.shared.firstLoadGlobalGroupList()
        NewsDataStorage.shared.firstLoadNews()
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
