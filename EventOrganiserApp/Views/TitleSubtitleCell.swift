//
//  TitleSubtitleCell.swift
//  EventOrganiserApp
//
//  Created by bayraktar on 12.04.2023.
//

import UIKit


final class TitleSubtitleCell: UITableViewCell{
    let titleLabel = UILabel()
    let subtitleTextField = UITextField()
    let verticalStackView = UIStackView()
    let constant: CGFloat = 15
    private var viewModel : TitleSubtitleCellViewModel?
    
    private let datePickerView = UIDatePicker()
    private let toolbar = UIToolbar(frame: .init(x: 0, y: 0, width: 100, height: 100))
    lazy var doneButton: UIBarButtonItem = {
        UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tappedDone))
    }()
    
    private let photoImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupHiearracy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func update(with viewModel: TitleSubtitleCellViewModel){
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
        subtitleTextField.text = viewModel.subtitle
        subtitleTextField.placeholder = viewModel.placeHolder
        
        subtitleTextField.inputView = viewModel.type == .text ? nil : datePickerView
        subtitleTextField.inputAccessoryView = viewModel.type == .text ? nil : toolbar
        
        photoImageView.isHidden = viewModel.type != .image
        subtitleTextField.isHidden = viewModel.type == .image
        
        photoImageView.image = viewModel.image
        
        verticalStackView.spacing = viewModel.type == .image ? 15 : verticalStackView.spacing
    }
    
    private func setupViews(){
        verticalStackView.axis = .vertical
        titleLabel.font = .systemFont(ofSize: 22, weight: .medium)
        subtitleTextField.font = .systemFont(ofSize: 20, weight: .medium)
        
        [verticalStackView, subtitleTextField, titleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        toolbar.setItems([doneButton], animated: false)
        datePickerView.datePickerMode = .date
        
        photoImageView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        photoImageView.layer.cornerRadius = 10
    
    }
    
    private func setupHiearracy(){
        contentView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(subtitleTextField)
        verticalStackView.addArrangedSubview(photoImageView)
        
    }
    private func setupLayout(){
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: constant),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -constant),
            verticalStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: constant),
            verticalStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -constant)])
        
        photoImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    
    @objc func tappedDone(){
        viewModel?.update(datePickerView.date)
    }
}
