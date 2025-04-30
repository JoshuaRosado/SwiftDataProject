//
//  Job.swift
//  SwiftDataProject
//
//  Created by Joshua Rosado Olivencia on 3/29/25.
//

import Foundation
import SwiftData



// SwiftData with iCloud has requirements that local SwiftData does not
// All properties must be optional or have a default values, and all relationship must be optional

@Model
class Job {
    // Adjusting properties with default values
    var name: String = "None"
    var priority: Int = 1
    // Linking this model with User model somehow
    var owner: User?
    
    init(name: String, priority: Int, owner: User? = nil) {
        self.name = name
        self.priority = priority
        self.owner = owner
    }
}
