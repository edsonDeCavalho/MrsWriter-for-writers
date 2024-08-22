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
            // Check if it's the first launch and navigate accordingly
            if launchManager.isFirstLaunch {
                WelcomeView()
            } else {
                ContentView()
            }
        }
        .modelContainer(for: [TextClass.self, BookClass.self])
    }
}


