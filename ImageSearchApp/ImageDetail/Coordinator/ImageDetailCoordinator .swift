//
//  ImageDetailCoordinator .swift
//  ImageSearchApp
//
//  Created by Никита Иващенков on 10.02.2023.
//

import UIKit

class ImageDetailCoordinator: Coordinator {
    private(set) var childCoordinators = [Coordinator]()
    private var navigationController: UINavigationController
    private let imageDetail: ImageDetail
    
    init(imageDetail: ImageDetail, navigationController: UINavigationController) {
        self.imageDetail = imageDetail
        self.navigationController = navigationController
    }
    
    func start() {
        let imageDetailVC = ImageDetailConfigurator.createImageDetail(
            imageDetail: imageDetail,
            navigationController: navigationController)
        
        navigationController.pushViewController(imageDetailVC, animated: true)
    }
    
    func onSelect(url: URL) {
        let sourceImageCoordinator = SourceImageCoordinator(
            url: url,
            navigationController: navigationController)
        
        childCoordinators.append(sourceImageCoordinator)
        sourceImageCoordinator.start()
    }
}
