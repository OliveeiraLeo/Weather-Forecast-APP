//  SceneDelegate.swift
//  Weather Forecast APP
//  Created by Leonardo Oliveira on 10/02/24.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)

        let locationViewController = LocationViewController()
        let navigationController = UINavigationController(rootViewController: locationViewController)
        navigationController.navigationBar.isUserInteractionEnabled = false
        navigationController.navigationBar.isHidden = true

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
