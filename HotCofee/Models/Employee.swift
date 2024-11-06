//
//  Employee.swift
//  HotCofee
//
//  Created by Dongjun Lee on 11/6/24.
//

import Foundation

struct Employee: Identifiable {
    let id: UUID
    var name: String
    var role: String
    var department: String
}
