//
//  CoffeeOrderListViewModel.swift
//  HotCofee
//
//  Created by Dongjun Lee on 11/6/24.
//

import Foundation
import Observation

@Observable
class CoffeeOrderListViewModel {
    var orders: [CoffeeOrder] = []
    var httpClient: HTTPClient
    
    init(httpClient: HTTPClient){
        self.httpClient = httpClient
    }
    
    func loadOrders() async throws {
        let resource = Resource(url: APIs.orders.url, modelType: [CoffeeOrder].self)
        orders = try await httpClient.load(resource)
    }
}
