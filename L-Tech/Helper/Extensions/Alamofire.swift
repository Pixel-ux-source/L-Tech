//
//  Alamofire.swift
//  L-Tech
//
//  Created by Алексей on 15.06.2025.
//

import Foundation

extension String {
    func formattedPhoneNumber() -> String {
        self.replacingOccurrences(of: "+", with: "")
            .replacingOccurrences(of: " ", with: "")
            .replacingOccurrences(of: "-", with: "")
            .replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
    }
}
