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

struct ContentView: View {
    @EnvironmentObject var dayTeams: DayTeams
    @State private var selectedTab = 0
    @State private var isShowingScanner = false
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    PageListViewLayout(tab: 1, detailsView: AnyView(RobotDetailsView(team: 3990)), title: "Robots")
                        .environmentObject(DayTeams())
                        .tabItem {
                            Image(systemName: "gear.circle")
                            Text("Robot")
                    }
                    PageListViewLayout(tab: 2, detailsView: AnyView(StatisticsDetailsView()), title: "Statistics")
                        .environmentObject(DayTeams())
                        .tabItem {
                            Image(systemName: "chart.line.uptrend.xyaxis")
                            Text("Statistics")
                    }
                    
                }
            }
            ScanButtonView()
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
