//
//  UserDetailsRequest.swift
//  NetworkManagerExample
//
//  Created by Khoa Vo on 6/5/25.
//

import Foundation
import NetworkManager

struct UserDetailsRequest: Requestable {
    typealias Response = UserModel
    var urlPath: String {
        Constants.Network.URLPath.users.rawValue + "/\(userId)"
    }
    var httpMethod: HTTPMethod = .get
    
    let userId: Int
}
