//
//  AppCoordinator.swift
//  L-Tech
//
//  Created by Алексей on 10.06.2025.
//

import UIKit

public final class AppCoordinator: CoordinatorProtocol {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = AuthBuilder.build()
        vc.coordinator = self
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(vc, animated: false)
    }
    
    func openHomeScreen() {
        let vc = HomeBuilder.build()
        vc.coordinator = self
        vc.navigationItem.hidesBackButton = true
        navigationController.setNavigationBarHidden(false, animated: true)
        navigationController.pushViewController(vc, animated: true)
    }
}
