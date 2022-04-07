//
//  ScoutingSheetInfoView.swift
//  Scout Insights
//
//  Created by Domenico Valentino on 2022-04-06.
//

import SwiftUI

struct ScoutingSheetInfoView: View {
    var (scoutingSheet): (ScoutingSheet)
    @State var matchNumber: Int
    var body: some View {
        VStack{
            Spacer()
            Text("Match \(String(matchNumber))")
                .font(.system(size: 60))
            Divider()
            Spacer()
            ZStack{
                HStack{
                    VStack(alignment: .leading){
                        Text("Match Info")
                            .font(.largeTitle)
                        Text("Match: \(String(scoutingSheet.matchNumber))")
                            .padding(10)
                        Text(scoutingSheet.day.rawValue)
                            .padding(10)
                        Text("\(scoutingSheet.alliance.rawValue) Alliance")
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
                        Text("Auto Fouls: \(String(scoutingSheet.autoFouls))")
                            .padding(10)
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        Text("Tele Operated")
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
                        Text("Partner On Bar: \(String(scoutingSheet.partnerOnBar))")
                            .padding(10)
                        Spacer()
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
                        Spacer()
                    }
                    Spacer()
                    Spacer()
                }
                .padding(.horizontal)
            }.font(.body)
            Divider()
            Spacer()
            Spacer()
            Spacer()
        }
    }
}

struct ScoutingSheetInfoView_Previews: PreviewProvider {
    static let scoutingSheet = ScoutingSheet(id: "123456abcdef", matchNumber: 1, day: DayEnum.DAY1, alliance: AllianceEnum.BLUE, teamNumber: 3990, taxi: true, autoCargoUpperHub: 3, autoCargoLowerHub: 5, autoFouls: 2, teleopCargoUpperHub: 5, teleopCargoLowerHub: 4, teleopFouls: 7, climbTime: 9, successful: true, partnerOnBar: true, robotSpeed: RobotSpeedEnum.FAST, driverSkills: DriverSkillsEnum.GOOD, defenseQuality: DefenseQualityEnum.GOOD)
    
    static var previews: some View {
        ScoutingSheetInfoView(scoutingSheet: scoutingSheet, matchNumber: 1)
    }
}
