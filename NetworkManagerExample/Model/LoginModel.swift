//
//  LoginModel.swift
//  NetworkManagerExample
//
//  Created by Khoa Vo on 15/5/25.
//

import Foundation

struct LoginModel: Codable {
    let success: Bool
    let message: String?
    let token: String?
}
