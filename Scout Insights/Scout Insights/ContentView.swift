//
//  ContentView.swift
//  Scout Insights
//
//  Created by Samuel Proulx on 2022-04-01.
//

import CodeScanner
import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var isShowingScanner = false
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    PageListViewLayout(tab: 1, detailsView: AnyView(RobotDetailsView()), title: "Robots")
                        .tabItem {
                            Image(systemName: "gear.circle")
                            Text("Robot")
                    }
                    PageListViewLayout(tab: 2, detailsView: AnyView(StatisticsDetailsView()), title: "Statistics")
                        .tabItem {
                            Image(systemName: "chart.line.uptrend.xyaxis")
                            Text("Statistics")
                    }
                    
                }
            }
            ScanButtonView()
            DayButtonView()
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        
        
    }
}

@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    @available(iOS 15.0, *)
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
