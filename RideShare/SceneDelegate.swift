//
//  SceneDelegate.swift
//  RideShare
//
//  Created by Pushpank Kumar on 24/11/19.
//  Copyright © 2019 Pushpank Kumar. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    fileprivate var containerViewController = ContainerViewController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        setRoot()
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }
}

extension SceneDelegate {
    private func setRoot() {
        containerViewController = ContainerViewController()
        window?.rootViewController = containerViewController
        window?.makeKeyAndVisible()
    }
}
