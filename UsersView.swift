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
    // New query object from data that is passed in
    // Making the query that makes the Array
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]){
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
}

#Preview {
    UsersView(minimumJoinDate: .now, sortOrder: [SortDescriptor( \User.name)])
        .modelContainer(for: User.self)
}
