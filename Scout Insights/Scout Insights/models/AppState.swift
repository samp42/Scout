//
//  State.swift
//  Scout Insights
//
//  Created by Samuel Proulx on 2022-04-07.
//

import Foundation

// hold all sheets and global runtime variables
class AppState: ObservableObject {
    // all scouting sheets
    @Published var scoutingSheets: [ScoutingSheet] = []
    // all teams that have at least one scouting sheet
    @Published var teams: [Int] = []
    
    func addScoutingSheet(scoutingSheet: ScoutingSheet) {
        // only add if no sheet exists with same id
        if(self.scoutingSheets.filter({$0.id == scoutingSheet.id}).isEmpty) {
            self.scoutingSheets.append(scoutingSheet)
            
            // add team to list of teams if not already present
            if(teams.isEmpty || !teams.contains(scoutingSheet.teamNumber)) {
                teams.append(scoutingSheet.teamNumber)
            }
        }
    }
    
    func getScoutingSheetsOfTeam(team: Int) -> [ScoutingSheet] {
        return self.scoutingSheets.filter({$0.teamNumber == team}).sorted(by: {
            return $0.matchNumber < $1.matchNumber
        })
    }
}
