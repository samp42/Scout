//
//  Scout_InsightsApp.swift
//  Scout Insights
//
//  Created by Samuel Proulx on 2022-04-01.
//

import SwiftUI

@main
struct Scout_InsightsApp: App {
    var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(appState)
        }
    }
}
