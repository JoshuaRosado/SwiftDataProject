//
//  EditUserView.swift
//  SwiftDataProject
//
//  Created by Joshua Rosado Olivencia on 3/24/25.
//

import SwiftUI
import SwiftData

struct EditUserView: View {
    @Bindable var user: User
    var body: some View {
        Form{
            TextField("Name", text: $user.name)
            TextField("City", text: $user.city)
            DatePicker("Join Date", selection: $user.joinDate)
        }
                .navigationTitle("Edit User")
                .navigationBarTitleDisplayMode(.inline)
    }
}

// Have to pass a SAMPLE OBJECT
// To use #Preview
#Preview {
    do {
        // make your configuration
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        
        // make your ModelContainer passing in our Config
        let container = try ModelContainer(for: User.self, configurations: config)
        
        // make new User
        let user = User(name: "BadBunny", city: "Vega Baja", joinDate: .now)
        
        // return View with new user and inject it into our SAMPLE CONTAINER for preview
        return EditUserView(user: user)
            .modelContainer(container)
        
        // catch any errors and displayed them in the console
    } catch{
        return Text("Failed to create container: \(error.localizedDescription)")
    }
    
}
