//
//  ListUsersView.swift
//  NetworkManagerExample
//
//  Created by Khoa Vo on 7/5/25.
//

import SwiftUI

struct ListUsersView: View {
    @State private var viewModel = UserViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if let errorMessage = viewModel.errorMessage {
                    ErrorMessageView(message: errorMessage)
                } else {
                    if let users = viewModel.users {
                        List {
                            ForEach(users) { user in
                                NavigationLink {
                                    UserDetailsView(userId: user.id)
                                } label: {
                                    UserRowView(user: user)
                                }
                            }
                        }
                        .refreshable {
                            await viewModel.fetchUsers(isRefresh: true)
                        }
                    } else {
                        LoadingView()
                    }
                }
            }
            .navigationTitle("listUsers".localized)
            .task {
                await viewModel.fetchUsers()
            }
        }
    }
}

#Preview {
    ListUsersView()
}
