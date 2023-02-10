//
//  ImageDetailConfigurator .swift
//  ImageSearchApp
//
//  Created by Никита Иващенков on 10.02.2023.
//

import UIKit

final class ImageDetailConfigurator {
    
    static func createImageDetail(imageDetail: ImageDetail, navigationController: UINavigationController) -> UIViewController {
        let viewController = ImageDetailViewController.instantiate()
        let viewModel = ImageDetailViewModel(imageDetail: imageDetail)
        let coordinator = ImageDetailCoordinator(imageDetail: imageDetail, navigationController: navigationController)
        viewController.imageDetailViewModel = viewModel
        viewModel.coordinator = coordinator
        
        return viewController
    }
}
