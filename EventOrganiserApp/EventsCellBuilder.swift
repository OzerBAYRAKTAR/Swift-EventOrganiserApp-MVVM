//
//  EventsCellBuilder.swift
//  EventOrganiserApp
//
//  Created by bayraktar on 13.04.2023.
//

import Foundation

struct EventsCellBuilder {
    func makeTitleSubtitleCellViewModel(_ type: TitleSubtitleCellViewModel.CellType, onCellUpdate: (() -> Void)? = nil) -> TitleSubtitleCellViewModel {
        switch type {
        case .text:
            return TitleSubtitleCellViewModel(
                title: "Name",
                subTitle: "",
                placeHolder: "Add a name",
                type: .text,
                onCellUpdate: onCellUpdate
            )
        case .date:
            return TitleSubtitleCellViewModel(
                title: "Date",
                subTitle: "",
                placeHolder: "Select a Date",
                type: .date,
                onCellUpdate: onCellUpdate
            )
        case .image:
            return TitleSubtitleCellViewModel(
                title: "Background",
                subTitle: "",
                placeHolder: "",
                type: .image,
                onCellUpdate : onCellUpdate
                )
        }
    }
}
