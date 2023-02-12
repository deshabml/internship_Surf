//
//  SceneDelegate.swift
//  internship_Surf
//
//  Created by Лаборатория on 10.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let winScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: winScene)
        window.rootViewController = ModelBuilder.createMainScreen()
        window.makeKeyAndVisible()
        self.window = window
        guard let _ = (scene as? UIWindowScene) else { return }
    }

}
