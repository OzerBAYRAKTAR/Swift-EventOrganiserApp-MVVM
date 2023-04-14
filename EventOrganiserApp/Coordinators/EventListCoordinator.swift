//
//  EventListCoordinator.swift
//  EventOrganiserApp
//
//  Created by bayraktar on 11.04.2023.
//

import UIKit
import CoreData

final class EventListCoordinator: Coordinator {
    private(set) var childCoordinators : [Coordinator] = []
    private let navigationController: UINavigationController
    var onSaveEvent = {}
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    func start() {
        let eventViewListController: EventListViewController = .instantiate()
        let eventListViewModel = EventListViewModel()
        eventListViewModel.coordinator = self
        onSaveEvent = eventListViewModel.reload
        eventViewListController.viewModel = eventListViewModel
        navigationController.setViewControllers([eventViewListController], animated: false)
        
    }
    func startAddEvent(){
        let addEventCoordinator = AddEventCoordinator(navigationController: navigationController)
        addEventCoordinator.parentCoordinator = self
        childCoordinators.append(addEventCoordinator)
        addEventCoordinator.start()
    }
    
    func onSelect(_ id : NSManagedObjectID){
        let eventDetailCoordinator = EventDetailCoordinator(eventID: id, navigationController: navigationController)
        childCoordinators.append(eventDetailCoordinator)
        eventDetailCoordinator.parentCoordinator = self
        eventDetailCoordinator.start()
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {
        
        
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool
            in
            return  childCoordinator === coordinator
            
        }){
            childCoordinators.remove(at: index)
        }
    }
}
