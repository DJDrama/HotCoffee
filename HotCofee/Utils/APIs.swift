//
//  APIs.swift
//  HotCofee
//
//  Created by Dongjun Lee on 11/6/24.
//

import Foundation

enum APIs {
    
    case orders
    case addOrder
   
    private var baseURL: URL {
        URL(string: "https://island-bramble.glitch.me")!
    }
    
    var url: URL {
        switch self {
            case .orders:
                return baseURL.appendingPathComponent("/orders")
            case .addOrder:
                return baseURL.appendingPathComponent("/newOrder")
        }
    }
}
