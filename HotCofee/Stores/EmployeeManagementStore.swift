//
//  EmployeeManagementStore.swift
//  HotCofee
//
//  Created by Dongjun Lee on 11/6/24.
//

import Foundation
import Observation

@Observable
class EmployeeManagementStore {
    
    var employees: [Employee] = []
    
    // Add Employee to the store
    func addEmployee(name: String, role: String, department: String) {
        let employee = Employee(id: UUID(), name: name, role: role, department: department)
        employees.append(employee)
    }
    
    // Retrieve employees by department
    func getEmployeesByDepartment(department: String) -> [Employee] {
        return employees.filter {
            $0.department == department
        }
    }
}
