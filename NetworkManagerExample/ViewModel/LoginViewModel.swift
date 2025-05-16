//
//  LoginViewModel.swift
//  NetworkManagerExample
//
//  Created by Khoa Vo on 15/5/25.
//

import Foundation
import Observation
import NetworkManager

@Observable
@MainActor
final class LoginViewModel {
    var token: String?
    var errorMessage: String?
    @ObservationIgnored private var loginModel: LoginModel?
    
    func login(username: String, password: String) async {
        do {
            let loginRequest = LoginRequest(username: username, password: password)
            loginModel = try await loginRequest.request()
            if let token = loginModel?.token {
                self.token = token
            }
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
