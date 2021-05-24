//
//  Session.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 24.05.2021.
//

import Foundation

final class Session {
    
    private init() {}
    
    static let shared = Session()
    
    var token: String = ""
    var userId: Int = 0
}
