//
//  SourceImageConfigurator .swift
//  ImageSearchApp
//
//  Created by Никита Иващенков on 10.02.2023.
//

import UIKit

final class SourceImageConfigurator {
    
    static func createSourceImage(url: URL) -> UIViewController {
        
        let viewController = SourceImageViewController.instantiate()
        let viewModel = SourceImageViewModel(url: url)
        viewController.sourceImageViewModel = viewModel
        
        return viewController
    }
}

