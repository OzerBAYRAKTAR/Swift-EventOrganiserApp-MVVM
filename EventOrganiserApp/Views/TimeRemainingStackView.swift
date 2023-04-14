//
//  TimeRemainingStackView.swift
//  EventOrganiserApp
//
//  Created by bayraktar on 14.04.2023.
//

import UIKit

final class TimeremainingStackView: UIStackView {
    private let timeRemainingLabels = [UILabel(), UILabel(), UILabel(), UILabel()]
    
    
    func setup(){
        timeRemainingLabels.forEach {
            addArrangedSubview($0)
        }
        axis = .vertical
        translatesAutoresizingMaskIntoConstraints = false
    }
    func update(with viewModel: TimeRemainingViewModel){
        
        timeRemainingLabels.forEach {
            $0.text = ""
            $0.font = .systemFont(ofSize: viewModel.fontSize, weight: .medium)
            $0.textColor = .white
        }
        
        viewModel.timeRemainingParts.enumerated().forEach{
            timeRemainingLabels[$0.offset].text = $0.element
        }
                      
        
        alignment = viewModel.alignment
        
    }
}
