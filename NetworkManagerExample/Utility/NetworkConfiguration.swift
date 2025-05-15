//
//  NetworkConfiguration.swift
//  NetworkManagerExample
//
//  Created by Khoa Vo on 5/5/25.
//

import Foundation
import NetworkManager

extension NetworkConfiguration {
    static var baseURL: URL? {
        URL(string: Constants.Network.baseURL)
    }
    
    static var apiVersion: String? { nil } // Example: "/v1"
}
