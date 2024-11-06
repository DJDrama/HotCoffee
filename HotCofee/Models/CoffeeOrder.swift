//
//  CoffeeOrder.swift
//  HotCofee
//
//  Created by Dongjun Lee on 11/6/24.
//

import Foundation

struct CoffeeOrder: Identifiable, Codable, Hashable {
    var id: Int?
    let name: String
    let coffeeName: String
    let total: Double
    let size: CoffeeSize
}

enum CoffeeSize: String, Codable, CaseIterable, Identifiable {
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
    
    var id: CoffeeSize { self }
}
