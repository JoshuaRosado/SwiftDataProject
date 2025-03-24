//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Joshua Rosado Olivencia on 3/24/25.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \User.name) var users: [User]
    
    // Path == empty array of User
    @State private var path = [User]()
    
    
    var body: some View {
        NavigationStack(path: $path){
            List(users){ user in
                NavigationLink(value: user) {
                    Text(user.name)
                }
            }
            .navigationTitle("Users")
            .navigationDestination(for: User.self){ user in
                EditUserView(user: user)
            }
            .toolbar{
                Button("Add User", systemImage: "plus"){
                    //
                    // Our user is a NEW USER
                    // no name, no city
                    let user = User(name: "", city: "", joinDate: .now)
                    // add new USER to our ModelContext
                    modelContext.insert(user)
                    //Push new USER into path
                    path = [user]
                    
                    
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
