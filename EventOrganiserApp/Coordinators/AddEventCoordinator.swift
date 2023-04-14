//
//  AddEventCoordinator.swift
//  EventOrganiserApp
//
//  Created by bayraktar on 11.04.2023.
//

import UIKit

final class AddEventCoordinator : Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController : UINavigationController
    private var modalNavigationController: UINavigationController?
    private var completion: (UIImage) -> Void = {_ in }
    
    var parentCoordinator : EventListCoordinator?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        self.modalNavigationController = UINavigationController()
        let addEventViewController : AddEventViewController = .instantiate()
        modalNavigationController?.setViewControllers([addEventViewController], animated: false)
        let addEventViewModel = AddEventViewModel(cellBuilder: EventsCellBuilder(), coreDataManager: CoreDataManager())
        addEventViewModel.coordinator = self
        addEventViewController.viewModel = addEventViewModel
        if let modalNavigationController = modalNavigationController {
            navigationController.present(modalNavigationController, animated: true, completion: nil)
        }
        
    }
    
    func didFinish(){
        parentCoordinator?.childDidFinish(self)
        }
    func didFinishSaveEvent(){
        parentCoordinator?.onSaveEvent()
        navigationController.dismiss(animated: false, completion: nil)
    }
    func showImagePicker(completion : @escaping (UIImage) -> Void){
        guard let modalNavigationController = modalNavigationController else {
            return
        }
        let imagePickerController = ImagePickerCoordinator(navigationController: modalNavigationController)
        self.completion = completion
        imagePickerController.parentCoordinator = self
        childCoordinators.append(imagePickerController)
        imagePickerController.start()
    }
    func didFinishPicking( _ image: UIImage){
        completion(image)
        modalNavigationController?.dismiss(animated: false, completion: nil)
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
