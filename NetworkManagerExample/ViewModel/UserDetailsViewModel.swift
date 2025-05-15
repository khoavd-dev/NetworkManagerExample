//
//  UserDetailsViewModel.swift
//  NetworkManagerExample
//
//  Created by Khoa Vo on 6/5/25.
//

import Foundation
import Observation
import NetworkManager

@Observable
@MainActor
final class UserDetailsViewModel {
    var user: UserModel?
    var errorMessage: String?
    
    func fetchUserDetails(id: Int) async {
        do {
            let userDetailsRequest = UserDetailsRequest(userId: id)
            user = try await userDetailsRequest.request()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
