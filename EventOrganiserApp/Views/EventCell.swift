//
//  EventCell.swift
//  EventOrganiserApp
//
//  Created by bayraktar on 13.04.2023.
//

import UIKit

final class EventCell: UITableViewCell {
    
    private let timeRemainingStackView = TimeremainingStackView()
    private let dateLabel = UILabel()
    
    private let eventNameLabel = UILabel()
    private let backgroundImageView = UIImageView()
    private let verticalStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpViews()
        setUpHiearracy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews(){
        
        timeRemainingStackView.setup()
        
        [dateLabel, eventNameLabel, backgroundImageView, verticalStackView].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
       
        
        dateLabel.font = .systemFont(ofSize: 24, weight: .medium)
        dateLabel.textColor = .white
        eventNameLabel.textColor = .white
        eventNameLabel.font = .systemFont(ofSize: 31, weight: .bold)
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .trailing
        
    }
    private func setUpHiearracy(){
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(verticalStackView)
        contentView.addSubview(eventNameLabel)
        
       
        verticalStackView.addArrangedSubview(timeRemainingStackView)
        verticalStackView.addArrangedSubview(UIView())
        verticalStackView.addArrangedSubview(dateLabel)
        
       
        
    }
    private func setupLayout(){
        backgroundImageView.pinToSuperviewEdges()
        verticalStackView.pinToSuperviewEdges([.top, .right, .bottom], constant: 15)
        let bottomConstraint = backgroundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        bottomConstraint.priority = .required - 1
        bottomConstraint.isActive = true
        
        backgroundImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        eventNameLabel.pinToSuperviewEdges([.bottom, .left], constant: 15)
        
    }
    
    func update(with viewModel: EventCellViewModel){
        if let timeRemainingViewModel = viewModel.timeRemainingViewModel {
            timeRemainingStackView.update(with: timeRemainingViewModel)
        }
        
        dateLabel.text = viewModel.dateText
        eventNameLabel.text = viewModel.eventName
        
        
        viewModel.loadImage { image in
            self.backgroundImageView.image = image
            
        }
        
    }
    
}
