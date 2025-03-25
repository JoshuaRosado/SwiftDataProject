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
    
    // filtering the #Predicate of User class model
    // If equation is true, then add user to our model
    // display each user that contains an "B" in its name
    @Query(filter: #Predicate<User> { user in
        user.name.localizedStandardContains("N") &&
        user.city == "Vega Baja"
    }, sort: \User.name) var users: [User]
    
    
    // Rewriting this query to be readable!
    
//    @Query(filter: #Predicate<User>) { user in {
//        if user.name.localizedStandardContains("N"){
//            if user.city == "Vega Baja"{
//                return true
//            }
//            return false
//        }
//        return false
//    }}
    
    
    @Query(filter: #Predicate<User> { user in
        user.age > 30 && user.city == "Vega Baja"
    } , sort: \User.age) var users2 : [User]

    var body: some View {
        NavigationStack{
            List(users2){ user in
                
                    Text(user.name)
                
            }
            .navigationTitle("Users")
            
            
            .toolbar{
                Button("Add Sample", systemImage: "plus"){
                    try? modelContext.delete(model: User.self)
                    
                    let first = User(name: "Residente", city: "Vega Baja", joinDate: .now.addingTimeInterval(86400 * -10), age: 44)
                    
                    let second = User(name: "Bad Bunny", city: "Vega Baja", joinDate: .now.addingTimeInterval(86400 * -5), age: 31)
                    
                    let third = User(name: "Kendrick Lamar", city: "Compton ", joinDate: .now.addingTimeInterval(86400 * 5), age: 36)
                    
                    let fourth = User(name: "Elvis Presley", city: "Memphis", joinDate: .now.addingTimeInterval(86400 * 10), age: 88)
                    
                    let fifth = User(name: "Lamar Odom", city: "LA", joinDate: .now.addingTimeInterval(86400 * 15), age: 46)
                    
                    
                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                    modelContext.insert(fifth)
                    
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
