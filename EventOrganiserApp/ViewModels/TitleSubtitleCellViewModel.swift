//
//  TitleSubtitleCellViewModel.swift
//  EventOrganiserApp
//
//  Created by bayraktar on 12.04.2023.
//

import Foundation
import UIKit


final class TitleSubtitleCellViewModel{
    
    enum CellType{
        case text
        case date
        case image
    }
    
    let title: String
    private(set) var subtitle: String
    let placeHolder: String
    let type: CellType
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter
    }()
    private(set) var onCellUpdate: (() -> Void)?
    private(set) var image: UIImage?
    
    init(title: String, subTitle: String, placeHolder: String, type: CellType, onCellUpdate: (() -> Void)?){
        self.title = title
        self.subtitle = subTitle
        self.placeHolder = placeHolder
        self.type = type
        self.onCellUpdate = onCellUpdate
        
    }
    func update(_ subtitle: String){
        self.subtitle = subtitle
        	
    }
    func update(_ date: Date){
        let dateString = dateFormatter.string(from: date)
        self.subtitle = dateString
        onCellUpdate?()
        
    }
    func update(_ image:UIImage){
        self.image = image
        onCellUpdate?()
    }
}
