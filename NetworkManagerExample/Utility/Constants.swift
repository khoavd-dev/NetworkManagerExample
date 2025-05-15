//
//  Constants.swift
//  NetworkManagerExample
//
//  Created by Khoa Vo on 5/5/25.
//

import Foundation

struct Constants {
    struct Network {
        static let baseURL = "https://json-placeholder.mock.beeceptor.com"
        
        enum URLPath: String {
            case users = "/users"
            case login = "/login"
        }
    }
    
    struct UI {
        static let avatarSize: CGFloat = 150
    }
}
