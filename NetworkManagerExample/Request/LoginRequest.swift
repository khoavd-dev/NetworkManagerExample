//
//  LoginRequest.swift
//  NetworkManagerExample
//
//  Created by Khoa Vo on 15/5/25.
//

import Foundation
import NetworkManager

struct LoginRequest: Requestable {
    typealias Response = LoginModel
    var urlPath: String = Constants.Network.URLPath.login.rawValue
    var httpMethod: HTTPMethod = .post
    var requestBody: Codable? {
        LoginRequestBody(username: username, password: password)
    }
    
    let username: String
    let password: String
}

fileprivate struct LoginRequestBody: Codable {
    let username: String
    let password: String
}
