//
//  Date+Extensions.swift
//  chatui-ios
//
//  Created by Franco Driansetti on 14/04/24.
//

import Foundation

extension Date {
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy HH:mm:ss"
        return formatter.string(from: self)
    }
}

