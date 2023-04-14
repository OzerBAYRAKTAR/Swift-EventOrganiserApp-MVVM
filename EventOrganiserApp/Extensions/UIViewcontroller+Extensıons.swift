//
//  UIViewcontroller+Extensıons.swift
//  EventOrganiserApp
//
//  Created by bayraktar on 11.04.2023.
//

import UIKit


extension UIViewController{
    static func instantiate<T>() -> T {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyBoard.instantiateViewController(identifier: "\(T.self)") as! T
        return controller
    }
}


