//
//  UserDetailsView.swift
//  NetworkManagerExample
//
//  Created by Khoa Vo on 5/5/25.
//

import SwiftUI

struct UserDetailsView: View {
    @State private var viewModel = UserDetailsViewModel()
    let userId: Int
    
    var body: some View {
        VStack {
            if let errorMessage = viewModel.errorMessage {
                ErrorMessageView(message: errorMessage)
            } else {
                if let user = viewModel.user {
                    if let photo = user.photo, let photoURL = URL(string: photo) {
                        AsyncImage(url: photoURL) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: Constants.UI.avatarSize, height: Constants.UI.avatarSize)
                        .background(Color.gray.opacity(0.3))
                        .clipShape(Circle())
                        .padding(.bottom)
                    }
                    
                    VStack {
                        infoRow(label: "name".localized, value: user.name.orEmpty)
                        infoRow(label: "company".localized, value: user.company.orEmpty)
                        infoRow(label: "email".localized, value: user.email.orEmpty)
                        infoRow(label: "address".localized, value: user.address.orEmpty)
                        infoRow(label: "country".localized, value: user.country.orEmpty)
                    }
                    .padding()
                    .background(Color.cyan.clipShape(RoundedRectangle(cornerRadius: 20)))
                } else {
                    LoadingView()
                }
            }
        }
        .padding()
        .task {
            await viewModel.fetchUserDetails(id: userId)
        }
    }
    
    func infoRow(label: String, value: String) -> some View {
        HStack {
            Text(label)
                .fontWeight(.bold)
            Spacer()
            Text(value)
        }
    }
}

#Preview {
    UserDetailsView(userId: 1)
}
