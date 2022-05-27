//
//  UPColors.swift
//  Upcuisine
//
//  Created by Rumeysa TAN on 27.05.2022.
//

import Foundation
import UIKit

enum AssetsColor {
    case foodDelivery
    case primary
    case primaryDark
    case secondary
    case secondaryLight
    case grayy
    case background
}

extension UIColor{
    
    static func upColor(_ name: AssetsColor) -> UIColor?{
        switch name{
            case.foodDelivery:
                return UIColor(named: "foodDelivery")
            case .primary:
                return UIColor(named: "primary")
            case .primaryDark:
                return UIColor(named: "primaryDark")
            case .secondary:
                return UIColor(named: "secondary")
            case .secondaryLight:
                return UIColor(named: "secondaryLight")
            case .grayy:
                return UIColor(named: "grayy")
            case .background:
                return UIColor(named: "background")
        }
    }
}
