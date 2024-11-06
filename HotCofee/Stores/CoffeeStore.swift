//
//  CoffeeStore.swift
//  HotCofee
//
//  Created by Dongjun Lee on 11/6/24.
//

import Foundation
import Observation

// This CoffeeStore is going to maintain the entire state of the application
// For larger apps we can create multiple stores based on the bounded context of the application
// and NOT BASED ON THE SCREENS
@Observable
class CoffeeStore {
    
    // For mocking you can use protocol
    // ex) HTTPClientProtocol
    let httpClient: HTTPClient
    
    var orders: [CoffeeOrder] = []
    
    init(httpClient: HTTPClient){
        self.httpClient = httpClient
    }

    func loadOrders() async throws {
        let resource = Resource(url: APIs.orders.url, modelType: [CoffeeOrder].self)
        orders = try await httpClient.load(resource)
    }
    
    func placeOrder(coffeeOrder: CoffeeOrder) async throws {
        let coffeeOrderData = try JSONEncoder().encode(coffeeOrder)
        let resource = Resource(url: APIs.addOrder.url, method: .post(coffeeOrderData), modelType: CoffeeOrder.self)
        let savedCoffeeOrder = try await httpClient.load(resource)
        orders.append(savedCoffeeOrder)
    }
}
