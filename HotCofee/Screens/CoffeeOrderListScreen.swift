//
//  CoffeeOrderListScreen.swift
//  HotCofee
//
//  Created by Dongjun Lee on 11/6/24.
//

import SwiftUI

struct CoffeeOrderListScreen: View {
    let coffeeOrderListVM: CoffeeOrderListViewModel
    @State private var isPresented: Bool = false
    
    init(coffeeOrderListVM: CoffeeOrderListViewModel) {
        self.coffeeOrderListVM = coffeeOrderListVM
    }
    
    var body: some View {
        List(coffeeOrderListVM.orders) { order in
            NavigationLink(value: order) {
                Text(order.name)
            }
        }
        .navigationDestination(for: CoffeeOrder.self, destination: { coffeeOrder in
            CoffeeDetailScreen(coffeeOrder: coffeeOrder)
        })
        .task {
            do {
                try await coffeeOrderListVM.loadOrders()
            } catch {
                print(error.localizedDescription)
            }
        }.navigationTitle("Orders")
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Order") {
                        isPresented = true
                    }
                }
            })
            .sheet(isPresented: $isPresented, content: {
                AddCoffeeOrderScreen(addOrderVM: AddOrderViewModel(httpClient: HTTPClient(), onSave: { coffeeOrder in
                    coffeeOrderListVM.orders.append(coffeeOrder)
                }))
            })
    }
}

#Preview {
    NavigationStack {
        CoffeeOrderListScreen(coffeeOrderListVM: CoffeeOrderListViewModel(httpClient: HTTPClient()))
    }
}

