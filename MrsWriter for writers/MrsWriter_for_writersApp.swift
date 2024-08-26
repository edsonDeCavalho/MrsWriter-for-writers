//
//  MrsWriter_for_writersApp.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 27/07/2024.
//

import SwiftUI
import SwiftData

@main
struct MrsWriter_for_writersApp: App {
    
    // Determine if this is the first launch
    @StateObject private var launchManager = LaunchManager()
    
    var body: some Scene {
        WindowGroup {
            // Adapt to the device type
            if UIDevice.current.userInterfaceIdiom == .pad {
                iPadView()
            } else {
                iPhoneView()
            }
        }
        .modelContainer(for: [TextClass.self, BookClass.self])
    }
    
    // View for iPad
    @ViewBuilder
    private func iPadView() -> some View {
        if launchManager.isFirstLaunch {
            WelcomeView() // Use a custom WelcomeView for iPad if needed
        } else {
            ContentView()
        }
    }
    
    // View for iPhone
    @ViewBuilder
    private func iPhoneView() -> some View {
        if launchManager.isFirstLaunch {
            WelcomeView() // Standard WelcomeView for iPhone
        } else {
            ContentView()
        }
    }
}

// Example SidebarView for iPad
struct SidebarVieww: View {
    var body: some View {
        List {
            NavigationLink(destination: ContentView()) {
                Label("Home", systemImage: "house")
            }
            NavigationLink(destination: IntroOne()) {
                Label("Other", systemImage: "square.and.pencil")
            }
        }
        .listStyle(SidebarListStyle())
    }
}

// Example iPad-specific Welcome View



// Sample LaunchManager implementation
class LaunchManager: ObservableObject {
    @Published var isFirstLaunch: Bool
    
    init() {
        let hasLaunchedBefore = UserDefaults.standard.bool(forKey: "hasLaunchedBefore")
        if hasLaunchedBefore {
            isFirstLaunch = false
        } else {
            isFirstLaunch = true
            UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
        }
    }
}

