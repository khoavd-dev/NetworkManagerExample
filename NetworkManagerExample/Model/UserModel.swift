//
//  UserModel.swift
//  NetworkManagerExample
//
//  Created by Khoa Vo on 5/5/25.
//

import Foundation

struct UserModel: Codable, Identifiable {
    let id: Int
    var name: String?
    var company: String?
    var email: String?
    var address: String?
    var country: String?
    var photo: String?
}
