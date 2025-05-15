//
//  UserViewModel.swift
//  NetworkManagerExample
//
//  Created by Khoa Vo on 5/5/25.
//

import Foundation
import Observation
import NetworkManager

@Observable
@MainActor
final class UserViewModel {
    var users: [UserModel]?
    var errorMessage: String?
    
    func fetchUsers(isRefresh: Bool = false) async {
        do {
            if isRefresh || users == nil {
                let userRequest = UserRequest()
                users = try await userRequest.request()
            }
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
