//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by Joshua Rosado Olivencia on 3/26/25.
//

import SwiftData
import SwiftUI


struct UsersView: View {
    @Query var users: [User]
    
    var body: some View {
        List(users){ user in
            
                Text(user.name)
            
        }
        
    }
    // INIT() = Replacing default value from this struct ***
    
    // Passing some data into the View saying "This is your filter/sort order
    // Using an initializer
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        // _users == is a new query of a Predicate of User
        // one user coming in
        _users = Query(filter: #Predicate<User> { user in
            
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder
        )
    }
    // Making the query that makes the Array
    
    
}

#Preview {
    UsersView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name)])
    // Make a model container for our User.self
        .modelContainer(for: User.self)
    
}
