//
//  EventDetailViewController.swift
//  EventOrganiserApp
//
//  Created by bayraktar on 14.04.2023.
//

import UIKit

final class EventDetailViewController: UIViewController{
    
    @IBOutlet weak var timeRemainingStackView: TimeremainingStackView! {
        didSet {
            timeRemainingStackView.setup()
        }
    }
    @IBOutlet weak var backgroundImage: UIImageView!
    var viewModel : EventDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            viewModel.onUpdate = { [weak self ] in
                guard let self = self, let timeRemainingViewModel = self.viewModel.timeRemainingViewModel else { return }
            self.backgroundImage.image = self.viewModel.image
            self.timeRemainingStackView.update(with: timeRemainingViewModel)
        }
        viewModel.viewDidLoad()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
        
    }
    
    
}
