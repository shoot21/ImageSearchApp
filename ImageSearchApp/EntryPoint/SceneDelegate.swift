//
//  SceneDelegate.swift
//  ImageSearchApp
//
//  Created by Никита Иващенков on 06.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let applicationCoordinator = AppCoordinator(window: window)
        applicationCoordinator.start()
        self.window = window
    }
}

