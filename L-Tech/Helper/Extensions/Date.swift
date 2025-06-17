//
//  String.swift
//  L-Tech
//
//  Created by Алексей on 16.06.2025.
//

import Foundation

extension Date {
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        formatter.locale = Locale(identifier: "ru_RU")
        
        return formatter.string(from: self)
    }
}
