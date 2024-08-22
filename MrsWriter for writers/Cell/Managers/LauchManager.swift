//
//  LauchManager.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 21/08/2024.
//

import Foundation
import SwiftData
import SwiftUI
// A class to manage the first launch status
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
