//
//  GetInfoService.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 03.06.2021.
//

import Foundation
import Alamofire

class GetInfoService {
    
    func getFriendsList() {
        
        AF.request("https://api.vk.com/method/friends.get?fields=online,photo_50,nickname&access_token=\(Session.shared.token)&v=5.131").responseJSON { response in
            guard let json = response.value else {return}
            print("FRIENDS", json)
            
        }
    }
    
    func getPhotoCollection() {
        AF.request("https://api.vk.com/method/photos.get?album_id=wall&rev=0&access_token=\(Session.shared.token)&v=5.131").responseJSON{ response in
            guard let json = response.value else { return }
            print("IMAGES", json)
        }
    }
    
    func getGroupsList() {
        AF.request("https://api.vk.com/method/groups.get?extended=1&filter=groups&access_token=\(Session.shared.token)&v=5.131").responseJSON{ response in
            guard let json = response.value else { return }
            print("GROUPS", json)
        }
    }
    
}
