//
//  SheetsPageView.swift
//  Scout Insights
//
//  Created by Samuel Proulx on 2022-04-07.
//

import SwiftUI
import CodeScanner

class ScanningData: ObservableObject{
    @Published var showScanner: Bool = false
    @Published var sheets: [ScoutingSheet] = []
}

struct SheetsPageView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var scanningData = ScanningData()
    @State private var scanningErrorMessage: String? = nil
    
    var body: some View {
        ZStack{
            NavigationView{
                List {
                    ForEach($appState.teams, id: \.self) {$team in
                        NavigationLink(destination: SheetsDetailsView(team: team, sheets: appState.getScoutingSheetsOfTeam(team: team))) {
                            SheetsListCellView(team: team)
                        }
                    }
                }.navigationTitle(Text("Scouting Sheets"))
            }
            ScanButtonView(scanningData: scanningData)
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
                self.scanningErrorMessage = "Received Unusual Object"
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
            } catch {
                self.scanningErrorMessage = "Failed to create ScoutingSheet"
            }
            
            appState.addScoutingSheet(scoutingSheet: scoutingSheet!)
            scanningData.sheets.append(scoutingSheet!)
            
        case .failure(_):
            self.scanningErrorMessage = "Failed to read QR code."
        }
        
    }
}

struct SheetsPageView_Previews: PreviewProvider {
    static let appState = AppState()
    
    static var previews: some View {
        SheetsPageView().environmentObject(appState)
    }
}
