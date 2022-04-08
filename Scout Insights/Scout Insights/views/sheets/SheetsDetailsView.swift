//
//  SheetsDetailsView.swift
//  Scout Insights
//
//  Created by Domenico Valentino on 2022-04-06.
//

import SwiftUI

struct SheetsDetailsView: View {
    @EnvironmentObject var appState: AppState
    
    let team: Int
    let sheets: [ScoutingSheet]

    var body: some View {
        ScrollView{
            ForEach(sheets, id: \.id) { sheet in
                ScoutingSheetInfoView(scoutingSheet: sheet, matchNumber: sheet.matchNumber)
            }
        }
    }
}

@available(iOS 15.0, *)
struct SheetsDetailsView_Previews: PreviewProvider {
    @available(iOS 15.0, *)
    static let appState = AppState()
//    appState.addScoutingSheet(scoutingSheet: ScoutingSheet(JSON: ScoutingSheet.makeJsonMock()))
    
    static var previews: some View {
        SheetsDetailsView(team: 3990, sheets: appState.getScoutingSheetsOfTeam(team: 3990))
            .environmentObject(appState)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
