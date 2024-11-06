//
//  CoffeeDetailScreen.swift
//  HotCofee
//
//  Created by Dongjun Lee on 11/6/24.
//

import SwiftUI

struct CoffeeDetailScreen: View {
    let coffeeOrder: CoffeeOrder
    var body: some View {
        VStack {
            Text(coffeeOrder.name)
            Text(coffeeOrder.coffeeName)
            Text(coffeeOrder.total, format: .currency(code: "USD"))
        }
    }
}

#Preview {
    CoffeeDetailScreen(
        coffeeOrder: CoffeeOrder(name: "Cosmo Krammer", coffeeName: "Cafe LAtte", total: 4.50, size: .large
        )
    )
}
