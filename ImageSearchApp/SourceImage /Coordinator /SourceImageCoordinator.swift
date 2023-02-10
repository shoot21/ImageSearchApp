//
//  SourceImageCoordinator.swift
//  ImageSearchApp
//
//  Created by Никита Иващенков on 10.02.2023.
//

import UIKit

class SourceImageCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    private let url: URL
    private let navigationController: UINavigationController
    
    init(url: URL, navigationController: UINavigationController) {
        self.url = url
        self.navigationController = navigationController
    }
    
    func start() {
        let sourceImageVC = SourceImageConfigurator.createSourceImage(url: url)
        navigationController.pushViewController(sourceImageVC, animated: true)
    }
}
