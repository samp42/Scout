//
//  SheetsDetailsView.swift
//  Scout Insights
//
//  Created by Domenico Valentino on 2022-04-06.
//

import SwiftUI

struct SheetsDetailsView: View {
    var scoutingSheet = ScoutingSheet(id: "123456abcdef",matchNumber: 1, day: DayEnum.DAY1, alliance: AllianceEnum.BLUE, teamNumber: 3990, taxi: true, autoCargoUpperHub: 3, autoCargoLowerHub: 5, autoFouls: 2, teleopCargoUpperHub: 5, teleopCargoLowerHub: 4, teleopFouls: 7, climbTime: 9, successful: true, tries: 1, partnerOnBar: true, robotSpeed: RobotSpeedEnum.FAST, driverSkills: DriverSkillsEnum.GOOD, defenseQuality: DefenseQualityEnum.GOOD)
    let team: Int
    var body: some View {
        ScrollView{
            ScoutingSheetInfoView(scoutingSheet: scoutingSheet, matchNumber: 1)
            ScoutingSheetInfoView(scoutingSheet: scoutingSheet, matchNumber: 2)
            ScoutingSheetInfoView(scoutingSheet: scoutingSheet, matchNumber: 3)
        }
    }
}

@available(iOS 15.0, *)
struct SheetsDetailsView_Previews: PreviewProvider {
    @available(iOS 15.0, *)
    static var previews: some View {
        SheetsDetailsView(team: 1)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
