//
//  AppCoordinator.swift
//  L-Tech
//
//  Created by Алексей on 10.06.2025.
//

import UIKit

public final class AppCoordinator: CoordinatorProtocol {
    private let window: UIWindow
    private let navigationController: UINavigationController
    private let tabBarController = UITabBarController()
    var dataManager: CoreDataManagerProtocol
    
    init(window: UIWindow, dataManager: CoreDataManagerProtocol) {
        self.window = window
        self.dataManager = dataManager
        self.navigationController = UINavigationController()
        self.navigationController.isNavigationBarHidden = true
    }
    
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        let vc = AuthBuilder.build()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func openHomeScreen() {
        HomeBuilder.build(dataManager: dataManager) { [weak self] vc in
            guard let self else { return }
            vc.coordinator = self
            
            let homeNav = UINavigationController(rootViewController: vc)
            homeNav.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))

            let favoritesVC = FavoritesBuilder.build()
            let favoritesNav = UINavigationController(rootViewController: favoritesVC)
            favoritesNav.tabBarItem = UITabBarItem(title: "Избранное", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))

            let profileVC = ProfileBuilder.build()
            let profileNav = UINavigationController(rootViewController: profileVC)
            profileNav.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
            
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            
            tabBarController.tabBar.standardAppearance = appearance
            tabBarController.tabBar.scrollEdgeAppearance = appearance

            tabBarController.viewControllers = [homeNav, favoritesNav, profileNav]
            self.window.rootViewController = self.tabBarController
        }
    }
    
    func openDetailScreen(date: String?, title: String?, image: UIImage? = nil, body: String?) {
        DetailsBuilder.build(date: date, title: title, image: image, body: body) { [weak self] vc in
            guard let self else { return }
            vc.coordinator = self
            vc.hidesBottomBarWhenPushed = true
            
            guard let currentController = self.tabBarController.selectedViewController as? UINavigationController else {
                print("No such controller")
                return
            }
            currentController.pushViewController(vc, animated: true)
        }
    }
}
