//
//  PersonalInfoView.swift
//  Settings
//
//  Created by Robert Martinez on 10/4/23.
//

import SwiftUI

struct PersonalInfoView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var updateDetails = false
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    init() {
        if let savedFirstName = UserDefaults.standard.string(forKey: "firstName"),
                   let savedLastName = UserDefaults.standard.string(forKey: "lastName") {
                    _firstName = State(initialValue: savedFirstName)
                    _lastName = State(initialValue: savedLastName)
                }
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section("User Details") {
//                    Text("User's full name")
                    Text("Name: \(fullName)")
                }
                
                Section("Update User Details") {
                    Toggle(isOn: $updateDetails) {
                        Label("Update Details", systemImage: updateDetails ? "lock.open" : "lock")
                    }
                    
                    Group {
                        TextField("Enter your first name", text: $firstName)
                        TextField("Enter your last name", text: $lastName)
                    }
                    .disabled(!updateDetails)
                    
                    Button("Save") {
                        UserDefaults.standard.set(firstName, forKey: "firstName")
                        UserDefaults.standard.set(lastName, forKey: "lastName")
                        updateDetails = false
                    }
                }
            }
            .navigationTitle("Personal Info")
        }
    }
}

#Preview {
    PersonalInfoView()
}
