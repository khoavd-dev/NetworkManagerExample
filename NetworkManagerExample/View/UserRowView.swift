//
//  UserRowView.swift
//  NetworkManagerExample
//
//  Created by Khoa Vo on 5/5/25.
//
import SwiftUI

struct UserRowView: View {
    let user: UserModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("name".localized + ": \(user.name.orEmpty)")
            Text("company".localized + ": \(user.company.orEmpty)")
        }
    }
}

#Preview {
    UserRowView(user: UserModel(id: 1, name: "Alex", company: "ABC"))
}
