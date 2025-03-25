//
//  User.swift
//  SwiftDataProject
//
//  Created by Joshua Rosado Olivencia on 3/24/25.
//

import Foundation
import SwiftData

@Model

class User {
    var name: String
    var city: String
    var joinDate: Date
    var age : Int
    
    init(name: String, city: String, joinDate: Date, age: Int) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
        self.age = age
    }
}
