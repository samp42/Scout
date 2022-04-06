//
//  SheetsDetailsView.swift
//  Scout Insights
//
//  Created by Domenico Valentino on 2022-04-06.
//

import SwiftUI

struct SheetsDetailsView: View {
    var scoutingSheet = ScoutingSheet(matchNumber: 1, day: DayEnum.DAY1, alliance: AllianceEnum.BLUE, teamNumber: 3990, taxi: true, autoCargoUpperHub: 3, autoCargoLowerHub: 5, autoFouls: 2, teleopCargoUpperHub: 5, teleopCargoLowerHub: 4, teleopFouls: 7, climbTime: 9, successful: true, tries: 1, partnerOnBar: true, robotSpeed: RobotSpeedEnum.FAST, driverSkills: DriverSkillsEnum.GOOD, defenseQuality: DefenseQualityEnum.GOOD)
    let team: Int
    var body: some View {
        VStack{
            ZStack{
                HStack{
                    VStack(alignment: .leading){
                        Text("Match Info")
                            .font(.largeTitle)
                        Text("Match: \(String(scoutingSheet.matchNumber))")
                            .padding(10)
                        Text(scoutingSheet.day.rawValue)
                            .padding(10)
                        Text(getAlliance())
                            .padding(10)
                        Text("Team \(scoutingSheet.teamNumber)")
                            .padding(10)
                        Text("Auto")
                            .font(.largeTitle)
                        Text("Taxi: \(String(scoutingSheet.taxi))")
                            .padding(10)
                        Text("Auto Cargo Upper Hub: \(String(scoutingSheet.autoCargoUpperHub))")
                            .padding(10)
                        Text("Auto Cargo Lower Hub: \(String(scoutingSheet.autoCargoLowerHub))")
                            .padding(10)
                        Text("AutoFouls: \(String(scoutingSheet.autoFouls))")
                            .padding(10)
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        Text("TeleOperated")
                            .font(.largeTitle)
                        Text("Teleop Cargo Upper Hub: \(String(scoutingSheet.teleopCargoUpperHub))")
                            .padding(10)
                        Text("Teleop Cargo Lower Hub: \(String(scoutingSheet.teleopCargoLowerHub))")
                            .padding(10)
                        Text("Teleop Fouls: \(String(scoutingSheet.teleopFouls))")
                            .padding(10)
                        Text("End Game")
                            .font(.largeTitle)
                        Text("Climb Time: \(String(scoutingSheet.climbTime))")
                            .padding(10)
                        Text("Successful: \(String(scoutingSheet.successful))")
                            .padding(10)
                        Text("Tries: \(String(scoutingSheet.tries))")
                            .padding(10)
                        Text("Partner On Bar: \(String(scoutingSheet.partnerOnBar))")
                            .padding(10)
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        Text("General")
                            .font(.largeTitle)
                        Text("Robot Speed: \(scoutingSheet.robotSpeed.rawValue)")
                            .padding(10)
                        Text("Driver Skills: \(scoutingSheet.driverSkills.rawValue)")
                            .padding(10)
                        Text("Defense Quality: \(scoutingSheet.defenseQuality.rawValue)")
                            .padding(10)
                    }
                    Spacer()
                }
                .padding(.horizontal)
            }.font(.body)
        }
    }
    
    func getAlliance() -> String {
        if (scoutingSheet.alliance == AllianceEnum.BLUE) {
            return "Blue Alliance"
        }
        else {
            return "Red Alliance"
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
