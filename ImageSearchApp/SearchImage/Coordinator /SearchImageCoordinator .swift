//
//  SearchImageCoordinator .swift
//  ImageSearchApp
//
//  Created by Никита Иващенков on 10.02.2023.
//

import UIKit

class SearchImageCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let searchImageVC = SearchImageConfigurator.createSearchImage(
            serviceLocator: ServiceLocator.shared,
            navigationController: navigationController)
        
        navigationController.setViewControllers([searchImageVC],
                                                animated: false)
    }
    
    func onSelect(_ imageDetail: ImageDetail) {
        let imageDetailCoordinator = ImageDetailCoordinator(
            imageDetail: imageDetail,
            navigationController: navigationController)
        
        childCoordinators.append(imageDetailCoordinator)
        imageDetailCoordinator.start()
    }
}
