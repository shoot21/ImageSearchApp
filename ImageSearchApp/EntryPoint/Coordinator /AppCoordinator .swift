//
//  AppCoordinator .swift
//  ImageSearchApp
//
//  Created by Никита Иващенков on 10.02.2023.
//

import UIKit

class AppCoordinator: Coordinator {    
    private(set) var childCoordinators: [Coordinator] = []
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        
        let searchCoordinator = SearchImageCoordinator(navigationController: navigationController)
        
        searchCoordinator.start()
        
        childCoordinators.append(searchCoordinator)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

