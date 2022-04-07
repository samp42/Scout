//
//  SheetsPageView.swift
//  Scout Insights
//
//  Created by Samuel Proulx on 2022-04-07.
//

import SwiftUI

struct SheetsPageView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        NavigationView{
            List {
                ForEach(appState.teams, id: \.self) {team in
                    NavigationLink(destination: SheetsDetailsView(team: team, sheets: appState.getScoutingSheetsOfTeam(team: team))) {
                        SheetsListCellView(team: team)
                    }
                }
            }.navigationTitle(Text("Scouting Sheets"))
        }
    }
}

struct SheetsPageView_Previews: PreviewProvider {
    static let appState = AppState()
    
    static var previews: some View {
        SheetsPageView().environmentObject(appState)
    }
}
