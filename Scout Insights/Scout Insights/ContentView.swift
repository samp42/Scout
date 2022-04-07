//
//  ContentView.swift
//  Scout Insights
//
//  Created by Samuel Proulx on 2022-04-01.
//

import CodeScanner
import SwiftUI


class ScanningData: ObservableObject{
    @Published var showScanner: Bool = false
    @Published var sheet: ScoutingSheet? = nil
}

struct ContentView: View {
    @StateObject var scanningData = ScanningData()
    @EnvironmentObject var appSate: AppState
    @State private var selectedTab = 0
    @State private var scanningErrorMessage: String? = nil
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    SheetsPageView()
                        .environmentObject(AppState())
                        .tabItem {
                            Image(systemName: "qrcode")
                            Text("Scouting Sheets")
                    }
//                    PageListViewLayout(tab: 2, detailsView: AnyView(StatisticsDetailsView()), title: "Statistics")
//                        .environmentObject(AppState())
//                        .tabItem {
//                            Image(systemName: "chart.line.uptrend.xyaxis")
//                            Text("Statistics")
//                    }
//                    PageListViewLayout(tab: 3, detailsView: AnyView(RobotDetailsView(team: 3990)), title: "Robots")
//                        .environmentObject(AppState())
//                        .tabItem {
//                            Image(systemName: "gear.circle")
//                            Text("Robot")
//                    }
                    
                }
            }
            ScanButtonView(scanningData: scanningData)
//            DayButtonView().environmentObject(DayTeams())
        }.sheet(isPresented: $scanningData.showScanner) {
            CodeScannerView(codeTypes: [.qr], simulatedData: "test", completion: handleScan)
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        scanningData.showScanner = false
        
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: ",")
            
            // expect 18 fields
            guard details.count == 18 else {
                scanningErrorMessage = "Received Unusual Object"
                return
            }
            
            var dict: [String: Any] = [:]
            
            for field in details {
                let pair = field.components(separatedBy: ":")
                
                dict.updateValue(
                    pair[1].trimmingCharacters(in: CharacterSet(charactersIn: "{ }")),
                    forKey: pair[0].trimmingCharacters(in: CharacterSet(charactersIn: "{ }")))
            }
            
            var scoutingSheet: ScoutingSheet?
            
            do{
                scoutingSheet = try ScoutingSheet(JSON: dict) ?? nil
                
                appSate.addScoutingSheet(scoutingSheet: scoutingSheet!)
                scanningData.sheet = scoutingSheet
            } catch {
                scanningErrorMessage = "Failed to create ScoutingSheet"
            }
            
        case .failure(_):
            scanningErrorMessage = "Failed to read QR code."
        }
        
    }
}

@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    @available(iOS 15.0, *)
    static var appState = AppState()
//    self.appState.scoutingSheets = ScoutingSheet(JSON: ScoutingSheet.makeJsonMock())
    
    static var previews: some View {
        ContentView()
            .environmentObject(appState)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
