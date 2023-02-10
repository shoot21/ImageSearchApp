//
//  Coordinator .swift
//  ImageSearchApp
//
//  Created by Никита Иващенков on 10.02.2023.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get }    
    func start() 
}
