//
//  ContentView.swift
//  Scout Insights
//
//  Created by Samuel Proulx on 2022-04-01.
//

import CodeScanner
import SwiftUI

class DayTeams: ObservableObject {
    @Published var dayTeams = day1Teams
}

class ScanningData: ObservableObject{
    @Published var showScanner: Bool = false
    @Published var sheet: ScoutingSheet? = nil
}

struct ContentView: View {
    @StateObject var scanningData = ScanningData()
    @EnvironmentObject var dayTeams: DayTeams
    @State private var selectedTab = 0
    @State private var isShowingScanner = false
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    PageListViewLayout(tab: 1, detailsView: AnyView(SheetsDetailsView(team: 3990)), title: "Scouting Sheets")
                        .environmentObject(DayTeams())
                        .tabItem {
                            Image(systemName: "qrcode")
                            Text("Scouting Sheets")
                    }
                    PageListViewLayout(tab: 2, detailsView: AnyView(StatisticsDetailsView()), title: "Statistics")
                        .environmentObject(DayTeams())
                        .tabItem {
                            Image(systemName: "chart.line.uptrend.xyaxis")
                            Text("Statistics")
                    }
                    PageListViewLayout(tab: 3, detailsView: AnyView(RobotDetailsView(team: 3990)), title: "Robots")
                        .environmentObject(DayTeams())
                        .tabItem {
                            Image(systemName: "gear.circle")
                            Text("Robot")
                    }
                    
                }
            }
            ScanButtonView(scanningData: scanningData)
            DayButtonView().environmentObject(DayTeams())
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        
        
    }
}

@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    @available(iOS 15.0, *)
    static let dayTeams = DayTeams()
    static var previews: some View {
        ContentView()
            .environmentObject(dayTeams)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
