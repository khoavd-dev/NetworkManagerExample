//
//  ErrorMessageView.swift
//  NetworkManagerExample
//
//  Created by Khoa Vo on 6/5/25.
//

import SwiftUI

struct ErrorMessageView: View {
    let message: String
    var body: some View {
        Text(message)
            .foregroundColor(.red)
    }
}

#Preview {
    ErrorMessageView(message: "Something went wrong!")
}
