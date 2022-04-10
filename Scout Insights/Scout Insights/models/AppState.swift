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
        // add sheet if no other same exists
        // replace existing sheet if one exists
        
        // add team to list of teams if not already present
        if(teams.isEmpty || !teams.contains(scoutingSheet.teamNumber)) {
            teams.append(scoutingSheet.teamNumber)
            return
        }
        
        if(self.scoutingSheets.filter({($0.teamNumber == scoutingSheet.teamNumber && $0.matchNumber == scoutingSheet.matchNumber)}).isEmpty) {
            self.scoutingSheets = self.scoutingSheets.filter({$0.teamNumber != scoutingSheet.teamNumber && $0.matchNumber != scoutingSheet.matchNumber})
            self.scoutingSheets.append(scoutingSheet)
        }
    }
    
    func getScoutingSheetsOfTeam(team: Int) -> [ScoutingSheet] {
        return self.scoutingSheets.filter({$0.teamNumber == team}).sorted(by: {
            return $0.matchNumber < $1.matchNumber
        })
    }
}
