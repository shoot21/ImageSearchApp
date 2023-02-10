//
//  SearchImageConfigurator .swift
//  ImageSearchApp
//
//  Created by Никита Иващенков on 10.02.2023.
//

import UIKit

final class SearchImageConfigurator {
    
    static func createSearchImage(serviceLocator: ServiceLocator, navigationController: UINavigationController) -> UIViewController {
        let viewController = SearchImageViewController.instantiate()
        let service: NetworkManager = serviceLocator.resolve()!
        let viewModel = SearchImageViewModel(service: service)
        let coordinator = SearchImageCoordinator(navigationController: navigationController)
        viewController.searchImageViewModel = viewModel
        viewModel.coordinator = coordinator
        return viewController
    }
    
}
