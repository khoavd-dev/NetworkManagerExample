//
//  LoadingView.swift
//  NetworkManagerExample
//
//  Created by Khoa Vo on 6/5/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .padding()
            .background(Color.gray.opacity(0.3).clipShape(RoundedRectangle(cornerRadius: 8)))
    }
}

#Preview {
    LoadingView()
}
