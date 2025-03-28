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
    
    @State private var showingUpcomingOnly = false
    
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    ]

    
    var body: some View {
        NavigationStack{
            // If BOOL is true
            // pass in current time (.now)
            // Only people who join after that date will be shown
            UsersView(minimumJoinDate: showingUpcomingOnly ? .now : .distantPast, sortOrder: sortOrder)
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
                
                Button(showingUpcomingOnly ? "Show Everyone" : "Show Upcoming"){
                    showingUpcomingOnly.toggle()
                    
                }
                Menu("Sort", systemImage: "arrow.up.arrow.down"){
                    Picker("Sort", selection: $sortOrder){
                        Text("Sort by Name")
                            .tag(
                                [
                                    SortDescriptor(\User.name),
                                    SortDescriptor(\User.joinDate)
                                ]
                            )
                        Text("Sort by Join Date")
                            .tag(
                                [
                                    SortDescriptor(\User.joinDate),
                                    SortDescriptor(\User.name)
                                ]
                            )
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
