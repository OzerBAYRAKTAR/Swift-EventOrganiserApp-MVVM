//
//  AppCoordinator.swift
//  EventOrganiserApp
//
//  Created by bayraktar on 11.04.2023.
//

import UIKit


protocol Coordinator:AnyObject	 {
    var childCoordinators: [Coordinator]  {get}
    func start()
}
final class AppCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    private let window: UIWindow
    
    init(window: UIWindow){
        self.window = window
    }	
    func start() {
        let navigationController = UINavigationController()
        let eventListCoordinator = EventListCoordinator(navigationController: navigationController)
        childCoordinators.append(eventListCoordinator)
        eventListCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    
}
