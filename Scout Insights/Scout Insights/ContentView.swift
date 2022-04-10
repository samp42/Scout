//
//  ContentView.swift
//  Scout Insights
//
//  Created by Samuel Proulx on 2022-04-01.
//

import SwiftUI


struct ContentView: View {
    @StateObject var scanningData = ScanningData()
    @State private var scanningErrorMessage: String? = nil
    @EnvironmentObject var appState: AppState
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    SheetsPageView()
                        .environmentObject(appState)
                        .tabItem {
                            Image(systemName: "qrcode")
                            Text("Scouting Sheets")
                        }
                    
                    RobotsPageView()
                        .environmentObject(appState)
                        .tabItem {
                            Image(systemName: "gear")
                            Text("Robots")
                        }
                }
            }
        }
    }
}

@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    @available(iOS 15.0, *)
    static var appState = AppState()
//    self.appState.scoutingSheets.append(ScoutingSheet.getMock())

    static var previews: some View {
        ContentView()
            .environmentObject(appState)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
