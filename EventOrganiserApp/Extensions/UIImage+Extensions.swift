//
//  UIImage+Extensions.swift
//  EventOrganiserApp
//
//  Created by bayraktar on 14.04.2023.
//

import UIKit

extension UIImage {
    func sameExpectRatio(newHeight: CGFloat) -> UIImage {
        let scale = newHeight / size.height
        let newWidth = size.width * scale
        let newSize = CGSize(width: newWidth, height: newHeight)
        return UIGraphicsImageRenderer(size: newSize).image { _ in
            self.draw(in: .init(origin: .zero, size: newSize))
        }
    }
}
