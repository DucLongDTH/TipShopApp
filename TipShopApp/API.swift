//
//  API.swift
//  TipShopApp
//
//  Created by Long, Nguyen Duc on 11/9/24.
//

import Foundation
class API {
    static let shared = API()
    
    private init(){}
    
    func fetchData() -> [MenuItem] {
        return [
            MenuItem(name: "BURGER", price: 12.5, img: "burger"),
            MenuItem(name: "Chow Mein", price: 10.5, img: "chowMein"),
            MenuItem(name: "Dumplings", price: 11.5, img: "dumplings"),
            MenuItem(name: "Fried Chicken", price: 13.5, img: "friedChicken"),
            MenuItem(name: "Pizza", price: 14.5, img: "pizza"),
            MenuItem(name: "Soda", price: 15.5, img: "soda"),
            MenuItem(name: "Spaghetti", price: 16.5, img: "spaghetti"),
            MenuItem(name: "Steak", price: 17.5, img: "steak"),
            MenuItem(name: "Susi", price: 18.5, img: "sushi"),
        ]
    }
    
}
