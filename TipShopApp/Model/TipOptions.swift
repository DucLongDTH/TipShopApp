//
//  TipOptions.swift
//  TipShopApp
//
//  Created by Long, Nguyen Duc on 12/9/24.
//

import Foundation

enum TipOptions: Double {
    case small = 1.18
    case medium = 1.2
    case large = 1.22
    case none = 1
    
    func toPercentString() -> String {
        switch self {
        case.small:
            return "18%"
        case.medium:
            return "20%"
        case.large:
            return "22%"
        case.none:
            return "none"
        }
    }
}
