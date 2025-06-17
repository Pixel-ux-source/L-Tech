//
//  FavoritesBuilder.swift
//  L-Tech
//
//  Created by Алексей on 17.06.2025.
//

import UIKit

protocol FavoritesBuilderProtocol {
    static func build() -> FavoritesController
}

final class FavoritesBuilder: FavoritesBuilderProtocol {
    static func build() -> FavoritesController {
        let vc = FavoritesController()
        return vc
    }
}
