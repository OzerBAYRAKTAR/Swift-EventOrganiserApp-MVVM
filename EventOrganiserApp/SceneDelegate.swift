//
//  SceneDelegate.swift
//  EventOrganiserApp
//
//  Created by bayraktar on 11.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let sccene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: sccene)
        self.window = window
        
        self.appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
    }
	
    

}

