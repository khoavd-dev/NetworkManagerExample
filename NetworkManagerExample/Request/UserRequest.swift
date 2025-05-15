//
//  UserRequest.swift
//  NetworkManagerExample
//
//  Created by Khoa Vo on 5/5/25.
//

import Foundation
import NetworkManager

struct UserRequest: Requestable {
    typealias Response = UserModel
    var urlPath: String = Constants.Network.URLPath.users.rawValue
    var httpMethod: HTTPMethod = .get
}
