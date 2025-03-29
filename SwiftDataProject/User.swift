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
    // @Relationship == Modifier - WHEN DELETE THE USER, DELETE THEIR JOBS AS WELL
    @Relationship(deleteRule: .cascade) var jobs = [Job]() // empty Job array
    
    // ** MIGRATION = SwiftData will silently add the jobs property to all its existing users, giving them an empty array by default
    
    // ** MIGRATION = Moving, adapting, updating or data from one environment to another
    
    
    init(name: String, city: String, joinDate: Date, age: Int, job: [Job] = [Job]()) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
        self.age = age
        self.jobs = jobs
    }
}
