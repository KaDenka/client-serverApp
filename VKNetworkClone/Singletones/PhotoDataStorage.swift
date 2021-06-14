//
//  PhotoDataStorage.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 03.06.2021.
//

import Foundation
import UIKit

final class PhotoDataStorage {
    
    static let shared = PhotoDataStorage()
    
    private init() {}
    
    var photoArray = [Photo]()
    
}
