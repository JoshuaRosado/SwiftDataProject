//
//  Job.swift
//  SwiftDataProject
//
//  Created by Joshua Rosado Olivencia on 3/29/25.
//

import Foundation
import SwiftData

@Model
class Job {
    var name: String
    var priority: Int
    // Linking this model with User model somehow
    var owner: User?
    
    init(name: String, priority: Int, owner: User? = nil) {
        self.name = name
        self.priority = priority
        self.owner = owner
    }
}
