//
//  HomeBuilder.swift
//  L-Tech
//
//  Created by Алексей on 15.06.2025.
//

import Foundation

protocol HomeBuilderProtocol: AnyObject {
   static func build() -> HomeController
}

final class HomeBuilder: HomeBuilderProtocol {
    static func build() -> HomeController {
        let vc = HomeController()
        return vc
    }
    
    
}
