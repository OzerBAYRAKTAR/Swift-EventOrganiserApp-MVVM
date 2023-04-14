//
//  EventDetailViewModel.swift
//  EventOrganiserApp
//
//  Created by bayraktar on 14.04.2023.
//

import CoreData
import UIKit

final class EventDetailViewModel{
    private let eventID: NSManagedObjectID
    private let coreDataManager: CoreDataManager
    private var event: Event?
    var onUpdate = {}
    private let date = Date()
    var coordinator : EventDetailCoordinator?
    
    
    var image: UIImage?{
        guard let imageData = event?.image else {return nil}
        return UIImage(data: imageData)
    }
    init(eventID: NSManagedObjectID, coreDataManager: CoreDataManager = .shared){
        self.eventID = eventID
        self.coreDataManager = coreDataManager
    }
    var timeRemainingViewModel: TimeRemainingViewModel?{
        guard let eventDate = event?.date , let timeRemainingParts = date.timeRemaining(until: eventDate)?.components(separatedBy: ",")
        else { return nil }
        return TimeRemainingViewModel(
            timeRemainingParts: timeRemainingParts,
            mode: .detail)
    }
    
    func viewDidLoad(){
        event = coreDataManager.getEvent(eventID)
        onUpdate()
    }
    func viewDidDisappear(){
        coordinator?.didFinish()
    }
}
