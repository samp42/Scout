//
//  StatisticsDetailsView.swift
//  Scout Insights
//
//  Created by Domenico Valentino on 2022-04-03.
//

import SwiftUI

struct StatisticsDetailsView: View {
    var scoutingSheet = ScoutingSheet(matchNumber: 1, day: DayEnum.DAY1, alliance: AllianceEnum.BLUE, teamNumber: 3990, taxi: true, autoCargoUpperHub: 3, autoCargoLowerHub: 5, autoFouls: 2, teleopCargoUpperHub: 5, teleopCargoLowerHub: 4, teleopFouls: 7, climbTime: 9, successful: true, tries: 1, partnerOnBar: true, robotSpeed: RobotSpeedEnum.FAST, driverSkills: DriverSkillsEnum.GOOD, defenseQuality: DefenseQualityEnum.GOOD)
    var body: some View {
        ZStack{
            HStack{
                VStack{
                    Text("Match \(String(scoutingSheet.matchNumber))")
                    Spacer()
                    Text(scoutingSheet.day.rawValue)
                    Spacer()
                    Text(getAlliance())
                    Spacer()
                    Text("Team \(scoutingSheet.teamNumber)")
                    Spacer()
                }
                Spacer()
            }
            .padding(.horizontal, 20)
        }.font(.title)
    }
    
    func getAlliance() -> String {
        if (scoutingSheet.alliance == AllianceEnum.BLUE) {
            return "Blue Alliance"
        }
        else {
            return "Red Allliance"
        }
        
    }
}

@available(iOS 15.0, *)
struct StatisticsDetailsView_Previews: PreviewProvider {
    @available(iOS 15.0, *)
    static var previews: some View {
        StatisticsDetailsView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
