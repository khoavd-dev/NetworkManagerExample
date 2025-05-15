//
//  Extensions.swift
//  NetworkManagerExample
//
//  Created by Khoa Vo on 5/5/25.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}

extension Optional where Wrapped == String {
    var orEmpty: String {
        self ?? ""
    }
}
