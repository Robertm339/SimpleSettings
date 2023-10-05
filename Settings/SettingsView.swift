//
//  SettingsView.swift
//  Settings
//
//  Created by Robert Martinez on 10/4/23.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("darkModeToggle") private var darkModeToggle = false
    
    @State private var notifToggle = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Account") {                    
//                    NavigationLink {
//                        AccountView()
//                    } label: {
//                        Text("Account Settings")
//                    }

                    NavigationLink {
                        PersonalInfoView()
                    } label: {
                        Text("Personal Info")
                    }
                }
                
                Section("Device Settings") {
                    Toggle(isOn: $darkModeToggle) {
                        Label("Dark Mode", systemImage: darkModeToggle ? "eye.slash" : "eye")
                    }
                    .onChange(of: darkModeToggle) { _ , newValue in
                        toggleDarkMode(isOn: newValue)
                    }
                    
                    Toggle(isOn: $notifToggle) {
                        Label("Notifications", systemImage: notifToggle ? "bell" : "bell.slash")
                    }
                }

            }
            .navigationTitle("Settings")
        }
    }
    
    private func toggleDarkMode(isOn: Bool) {
        if isOn {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                windowScene.windows.first?.overrideUserInterfaceStyle = .dark
            }
            
        } else {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                windowScene.windows.first?.overrideUserInterfaceStyle = .light
            }
            
        }
    }
}

#Preview {
    SettingsView()
}
