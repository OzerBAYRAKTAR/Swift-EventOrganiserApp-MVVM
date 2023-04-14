//
//  EventDetailCoordinator.swift
//  EventOrganiserApp
//
//  Created by bayraktar on 14.04.2023.
//

import Foundation
import UIKit
import CoreData

final class EventDetailCoordinator: Coordinator {
    let childCoordinators: [Coordinator] = []
    private let navigationController : UINavigationController
    let eventID: NSManagedObjectID
    var parentCoordinator : EventListCoordinator?
    
    init(eventID: NSManagedObjectID, navigationController: UINavigationController){
        self.navigationController = navigationController
        self.eventID = eventID
    }
    
    func start() {
        let detailViewController: EventDetailViewController = .instantiate()
        let eventDetailViewModel = EventDetailViewModel(eventID: eventID)
        eventDetailViewModel.coordinator = self
        detailViewController.viewModel = EventDetailViewModel(eventID: eventID)
        navigationController.pushViewController(detailViewController, animated: false)
    }
    
    func didFinish(){
        parentCoordinator?.childDidFinish(self)
    }
}
