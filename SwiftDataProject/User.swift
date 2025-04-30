//
//  User.swift
//  SwiftDataProject
//
//  Created by Joshua Rosado Olivencia on 3/24/25.
//

import Foundation
import SwiftData

@Model

// SwiftData with iCloud has requirements that local SwiftData does not
// All properties must be optional or have a default values, and all relationship must be optional

class User {
    // Adjust properties with default values
    var name: String = "Anonymous"
    var city: String = "Unknown"
    var joinDate: Date = Date.now
    var age : Int = 1
    // @Relationship == Modifier - WHEN DELETE THE USER, DELETE THEIR JOBS AS WELL
    // This is a relationship so it must be Optional
    @Relationship(deleteRule: .cascade) var jobs: [Job]? = [Job]()
    // var jobs is a optional Array of Job = Empty Array of Job Default

    
    // unwrappedJobs is an Array of Job
    var unwrappedJobs: [Job] {
        jobs ?? []
        //send back jobs if not ?? send an empty array
        
    }
    init(name: String, city: String, joinDate: Date, age: Int, job: [Job] = [Job]()) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
        self.age = age
        self.jobs = jobs
    }
}
