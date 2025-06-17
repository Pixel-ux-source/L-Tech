//
//  ProfileBuilder.swift
//  L-Tech
//
//  Created by Алексей on 17.06.2025.
//

import UIKit

protocol ProfileBuilderProtocol {
    static func build() -> ProfileController
}

final class ProfileBuilder: ProfileBuilderProtocol {
    static func build() -> ProfileController {
        let vc = ProfileController()
        return vc
    }
}
