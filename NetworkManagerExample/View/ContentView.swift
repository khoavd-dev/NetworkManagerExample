//
//  ContentView.swift
//  NetworkManagerExample
//
//  Created by Khoa Vo on 5/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            LoginView()
                .tabItem {
                    Label("Login", systemImage: "house")
                }

            ListUsersView()
                .tabItem {
                    Label("Users", systemImage: "person.2.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
