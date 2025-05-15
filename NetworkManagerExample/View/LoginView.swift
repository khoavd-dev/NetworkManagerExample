//
//  LoginView.swift
//  NetworkManagerExample
//
//  Created by Khoa Vo on 7/5/25.
//

import SwiftUI

struct LoginView: View {
    @State private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            Button("login".localized) {
                Task {
                    await viewModel.login(username: "khoa", password: "success-password")
                }
            }
            .buttonStyle(.borderedProminent)
            
            if let errorMessage = viewModel.errorMessage {
                ErrorMessageView(message: errorMessage)
            } else {
                Text("token".localized + " \(viewModel.token.orEmpty)")
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    LoginView()
}
