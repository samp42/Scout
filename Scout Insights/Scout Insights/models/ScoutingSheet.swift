//
//  ScoutingSheet.swift
//  Scout Insights
//
//  Created by Samuel Proulx on 2022-04-03.
//

import Foundation
import SwiftUI

struct ScoutingSheet: Codable {
    // match info
    let matchNumber: UInt
    let day: DayEnum
    let alliance: AllianceEnum
    let teamNumber: UInt

    // auto
    let taxi: Bool
    let autoCargoUpperHub: UInt
    let autoCargoLowerHub: UInt
    let autoFouls: UInt
    let autoTechFouls: UInt

    // teleop
    let teleopCargoUpperHub: UInt
    let teleopCargoLowerHub: UInt
    let teleopFouls: UInt
    let teleopTechFouls: UInt

    // endgame
    let climbTime: UInt // number of seconds
    let partnerOnBar: Bool

    // general
    let robotSpeed: RobotSpeedEnum
    let driverSkills: DriverSkillsEnum
    let defenseQuality: DefenseQualityEnum
    
    public init(
        matchNumber: UInt,
        day: DayEnum,
        alliance: AllianceEnum,
        teamNumber: UInt,
        taxi: Bool,
        autoCargoUpperHub: UInt,
        autoCargoLowerHub: UInt,
        autoFouls: UInt,
        autoTechFouls: UInt,
        teleopCargoUpperHub: UInt,
        teleopCargoLowerHub: UInt,
        teleopFouls: UInt,
        teleopTechFouls: UInt,
        climbTime: UInt,
        partnerOnBar: Bool,
        robotSpeed: RobotSpeedEnum,
        driverSkills: DriverSkillsEnum,
        defenseQuality: DefenseQualityEnum
    ) {
        self.matchNumber = matchNumber
        self.day = day
        self.alliance = alliance
        self.teamNumber = teamNumber
        
        self.taxi = taxi
        self.autoCargoUpperHub = autoCargoUpperHub
        self.autoCargoLowerHub = autoCargoLowerHub
        self.autoFouls = autoFouls
        self.autoTechFouls = autoTechFouls
        
        self.teleopCargoUpperHub = teleopCargoUpperHub
        self.teleopCargoLowerHub = teleopCargoLowerHub
        self.teleopFouls = teleopFouls
        self.teleopTechFouls = teleopTechFouls
        
        self.climbTime = climbTime
        self.partnerOnBar = partnerOnBar
        
        self.robotSpeed = robotSpeed
        self.driverSkills = driverSkills
        self.defenseQuality = defenseQuality
    }
    
    public init?(JSON: [String: Any]) throws {
        guard let matchNumber = JSON["matchNumber"] as? UInt else {
            throw SerializationError.missing("matchNumber")
        }

        guard let dayJson = JSON["day"] as? String else {
            throw SerializationError.invalid("day", JSON["day"]!)
        }
        let day = try DayEnum(rawValue: dayJson)
                
        
        guard let allianceJson = JSON["alliance"] as? String else {
            throw SerializationError.invalid("alliance", JSON["alliance"]!)
        }
        let alliance = try AllianceEnum(rawValue: allianceJson)
        
        guard let teamNumber = JSON["teamNumber"] as? UInt else {
            throw SerializationError.missing(<#T##String#>)
        }
        
        guard let taxi = JSON[
//        let day = JSON["day"] as? DayEnum,
//        let alliance = JSON["alliance"] as? AllianceEnum,
//        let teamNumber = JSON["teamNumber"] as? UInt,
//        let taxi = JSON["taxi"] as? Bool,
//        let autoCargoUpperHub = JSON["autoCargoUpperHub"] as? UInt,
//        let autoCargoLowerHub = JSON["autoCargoLowerHub"] as? UInt,
//        let autoFouls = JSON["autoFouls"] as? UInt,
//        let autoTechFouls = JSON["autoTechFouls"] as? UInt,
//        let teleopCargoUpperHub = JSON["teleopCargoUpperHub"] as? UInt,
//        let teleopCargoLowerHub = JSON["teleopCargoLowerHub"] as? UInt,
//        let teleopFouls = JSON["teleopFouls"] as? UInt,
//        let teleopTechFouls = JSON["teleopTechFouls"] as? UInt,
//        let climbTime = JSON["climbTime"] as? UInt,
//        let partnerOnBar = JSON["partnerOnBar"] as? Bool,
//        let robotSpeed = JSON["robotSpeed"] as? RobotSpeedEnum,
//        let driverSkills = JSON["driverSkills"] as? DriverSkillsEnum,
//        let defenseQuality = JSON["defenseQuality"] as? DefenseQualityEnum
                
//        self.matchNumber = matchNumber
//        self.day = day
//        self.alliance = alliance
//        self.teamNumber = teamNumber
//
//        self.taxi = taxi
//        self.autoCargoUpperHub = autoCargoUpperHub
//        self.autoCargoLowerHub = autoCargoLowerHub
//        self.autoFouls = autoFouls
//        self.autoTechFouls = autoTechFouls
//
//        self.teleopCargoUpperHub = teleopCargoUpperHub
//        self.teleopCargoLowerHub = teleopCargoLowerHub
//        self.teleopFouls = teleopFouls
//        self.teleopTechFouls = teleopTechFouls
//
//        self.climbTime = climbTime
//        self.partnerOnBar = partnerOnBar
//
//        self.robotSpeed = robotSpeed
//        self.driverSkills = driverSkills
//        self.defenseQuality = defenseQuality
    }
    
    public static func makeJsonMock() -> [String: Any] {
        let dict: [String: Any] = [
            "matchNumber": 4,
            "day": "Day 1",
            "alliance": 0,
            "teamNumber": competingTeams["Day 1"]![10],
            "taxi": true,
            "autoCargoUpperHub": 3,
            "autoCargoLowerHub": 2,
            "autoFouls": 2,
            "autoTechFouls": 0,
            "teleopCargoUpperHub": 10,
            "teleopCargoLowerHub": 2,
            "teleopFouls": 2,
            "teleopTechFouls": 3,
            "climbTime": 29,
            "partnerOnBar": false,
            "robotSpeed": "Fast",
            "driverSkills": "Bad",
            "defenseQuality": "NA"
        ]
        
        return dict
    }
}
