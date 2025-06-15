//
//  AuthBuilder.swift
//  L-Tech
//
//  Created by Алексей on 10.06.2025.
//

import UIKit

protocol AuthBuilderProtocol {
    static func build() -> AuthController
}

public final class AuthBuilder: AuthBuilderProtocol {
    static func build() -> AuthController {
        let vc = AuthController()
        let networkService = NetworkService()
        let presenter = AuthPresenter(view: vc, networkService: networkService)
        vc.presenter = presenter
        return vc
    }
    
}
