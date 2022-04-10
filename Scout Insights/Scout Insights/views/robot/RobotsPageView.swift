//
//  RobotsPageView.swift
//  Scout Insights
//
//  Created by Samuel Proulx on 2022-04-08.
//

import SwiftUI

struct RobotsPageView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        NavigationView{
            List {
                ForEach($appState.teams, id: \.self) {$team in
                    NavigationLink(destination: RobotDetailsView(team: team, sheets: appState.getScoutingSheetsOfTeam(team: team))) {
                        RobotListCellView(team: team)
                    }
                }
            }.navigationTitle(Text("Robots"))
        }
    }
}

struct RobotsPageView_Previews: PreviewProvider {
    static let appState = AppState()
    
    static var previews: some View {
        RobotsPageView().environmentObject(appState)
    }
}
