//
//  Extensions.swift
//  TipShopApp
//
//  Created by DucLong on 15/09/2024.
//

import Foundation

extension [MenuItem] {
    func calculateTotal(with tip: TipOptions) -> Double {
        var total: Double = 0
        
        self.forEach { item in
            let count = Double(item.count)
            let sum = item.price * count
            total += sum
        }
        return total * tip.rawValue
    }
}
