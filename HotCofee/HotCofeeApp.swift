//
//  HotCofeeApp.swift
//  HotCofee
//
//  Created by Dongjun Lee on 11/6/24.
//

import SwiftUI

@main
struct HotCofeeApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                CoffeeOrderListScreen(coffeeOrderListVM: CoffeeOrderListViewModel(httpClient: HTTPClient()))
            }
        }
    }
}
