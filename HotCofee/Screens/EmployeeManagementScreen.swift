//
//  EmployeeManagementScreen.swift
//  HotCofee
//
//  Created by Dongjun Lee on 11/6/24.
//

import SwiftUI

struct EmployeeManagementScreen: View {
    
    @Environment(OrderingStore.self) private var orderingStore
    @Environment(EmployeeManagementStore.self) private var employeeManagementStore
    
    var body: some View {
        List {
            Section("Orders") {
                ForEach(orderingStore.orders) { order in
                    Text(order.name)
                }
            }
            
            Section("Employees") {
                ForEach(employeeManagementStore.employees) { employee in
                    Text(employee.name)
                }
            }
        }
    }
}

#Preview {
    EmployeeManagementScreen()
        .environment(EmployeeManagementStore())
        .environment(OrderingStore(httpClient: HTTPClient()))
}
