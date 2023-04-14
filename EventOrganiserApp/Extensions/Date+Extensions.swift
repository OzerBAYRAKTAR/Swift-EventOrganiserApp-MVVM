//
//  Date+Extensions.swift
//  EventOrganiserApp
//
//  Created by bayraktar on 13.04.2023.
//

import Foundation

extension Date{
    func timeRemaining(until endDate: Date) -> String? {
        let dateComponentFormatter = DateComponentsFormatter()
        dateComponentFormatter.allowedUnits = [.year, .month, .weekOfMonth, .day]
        dateComponentFormatter.unitsStyle = .full
        return dateComponentFormatter.string(from: self, to: endDate)
    }
}
