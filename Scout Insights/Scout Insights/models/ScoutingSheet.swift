//
//  ScoutingSheet.swift
//  Scout Insights
//
//  Created by Samuel Proulx on 2022-04-03.
//

import Foundation
import SwiftUI

struct ScoutingSheet {
    // scouting sheet id
    let id: String
    
    // match info
    let matchNumber: Int
    let day: DayEnum
    let alliance: AllianceEnum
    let teamNumber: Int

    // auto
    let taxi: Bool
    let autoCargoUpperHub: Int
    let autoCargoLowerHub: Int
    let autoFouls: Int

    // teleop
    let teleopCargoUpperHub: Int
    let teleopCargoLowerHub: Int
    let teleopFouls: Int

    // endgame
    let climbTime: Int // number of seconds
    let successful: Bool
    let tries: Int
    let partnerOnBar: Bool

    // general
    let robotSpeed: RobotSpeedEnum
    let driverSkills: DriverSkillsEnum
    let defenseQuality: DefenseQualityEnum
    
    public init(
        id: String,
        matchNumber: Int,
        day: DayEnum,
        alliance: AllianceEnum,
        teamNumber: Int,
        taxi: Bool,
        autoCargoUpperHub: Int,
        autoCargoLowerHub: Int,
        autoFouls: Int,
        teleopCargoUpperHub: Int,
        teleopCargoLowerHub: Int,
        teleopFouls: Int,
        climbTime: Int,
        successful: Bool,
        tries: Int,
        partnerOnBar: Bool,
        robotSpeed: RobotSpeedEnum,
        driverSkills: DriverSkillsEnum,
        defenseQuality: DefenseQualityEnum
    ) {
        self.id = id
        self.matchNumber = matchNumber
        self.day = day
        self.alliance = alliance
        self.teamNumber = teamNumber
        
        self.taxi = taxi
        self.autoCargoUpperHub = autoCargoUpperHub
        self.autoCargoLowerHub = autoCargoLowerHub
        self.autoFouls = autoFouls
        
        self.teleopCargoUpperHub = teleopCargoUpperHub
        self.teleopCargoLowerHub = teleopCargoLowerHub
        self.teleopFouls = teleopFouls
        
        self.climbTime = climbTime
        self.successful = successful
        self.tries = tries
        self.partnerOnBar = partnerOnBar
        
        self.robotSpeed = robotSpeed
        self.driverSkills = driverSkills
        self.defenseQuality = defenseQuality
    }
    
    public init?(JSON: [String: Any]) throws {
        guard let id = JSON["id"] as? String else {
            throw SerializationError.invalid("id", JSON["id"]!)
        }
        
        guard let matchNumber = JSON["matchNumber"] as? Int else {
            throw SerializationError.missing("matchNumber")
        }

        guard let dayJson = JSON["day"] as? String else {
            throw SerializationError.invalid("day", JSON["day"]!)
        }
        let day = DayEnum(rawValue: dayJson)
                
        
        guard let allianceJson = JSON["alliance"] as? Int else {
            throw SerializationError.invalid("alliance", JSON["alliance"]!)
        }
        let alliance = AllianceEnum(rawValue: allianceJson)
        
        guard let teamNumber = JSON["teamNumber"] as? Int else {
            throw SerializationError.missing("teamNumber")
        }
        
        guard let taxi = JSON["taxi"] as? Bool else {
            throw SerializationError.missing("taxi")
        }
        
        guard let autoCargoUpperHub = JSON["autoCargoUpperHub"] as? Int else {
            throw SerializationError.missing("autoCargoUpperHub")
        }
        
        guard let autoCargoLowerHub = JSON["autoCargoLowerHub"] as? Int else {
            throw SerializationError.missing("autoCargoLowerHub")
        }
        
        guard let autoFouls = JSON["autoFouls"] as? Int else {
            throw SerializationError.missing("autoFouls")
        }
        
        guard let teleopCargoUpperHub = JSON["teleopCargoUpperHub"] as? Int else {
            throw SerializationError.missing("teleopCargoUpperHub")
        }
        
        guard let teleopCargoLowerHub = JSON["teleopCargoLowerHub"] as? Int else {
            throw SerializationError.missing("teleopCargoLowerHub")
        }
        
        guard let teleopFouls = JSON["teleopFouls"] as? Int else {
            throw SerializationError.missing("teleopFouls")
        }
        
        guard let climbTime = JSON["climbTime"] as? Int else {
            throw SerializationError.missing("climbTime")
        }
        
        guard let successful = JSON["successful"] as? Bool else {
            throw SerializationError.missing("successful")
        }
        
        guard let tries = JSON["tries"] as? Int else {
            throw SerializationError.missing("tries")
        }

        guard let partnerOnBar = JSON["partnerOnBar"] as? Bool else {
            throw SerializationError.missing("partnerOnBar")
        }
        
        guard let robotSpeedJson = JSON["robotSpeed"] as? String else {
            throw SerializationError.invalid("robotSpeed", JSON["robotSpeed"]!)
        }
        let robotSpeed = RobotSpeedEnum(rawValue: robotSpeedJson)
        
        guard let driverSkillsJson = JSON["driverSkills"] as? String else {
            throw SerializationError.invalid("driverSkills", JSON["driverSkills"]!)
        }
        let driverSkills = DriverSkillsEnum(rawValue: driverSkillsJson)
        
        guard let defenseQualityJson = JSON["defenseQuality"] as? String else {
            throw SerializationError.invalid("defenseQuality", JSON["defenseQuality"]!)
        }
        let defenseQuality = DefenseQualityEnum(rawValue: defenseQualityJson)
    
        self.id = id
        
        self.matchNumber = matchNumber
        self.day = day!
        self.alliance = alliance!
        self.teamNumber = teamNumber

        self.autoCargoUpperHub = autoCargoUpperHub
        self.autoCargoLowerHub = autoCargoLowerHub
        self.taxi = taxi
        self.autoFouls = autoFouls

        self.teleopCargoUpperHub = teleopCargoUpperHub
        self.teleopCargoLowerHub = teleopCargoLowerHub
        self.teleopFouls = teleopFouls

        self.climbTime = climbTime
        self.successful = successful
        self.tries = tries
        self.partnerOnBar = partnerOnBar

        self.robotSpeed = robotSpeed!
        self.driverSkills = driverSkills!
        self.defenseQuality = defenseQuality!
    }
    
    public static func makeJsonMock() -> [String: Any] {
        let dict: [String: Any] = [
            "id": "12345abcdef",
            "matchNumber": 4,
            "day": "Day 1",
            "alliance": 0,
            "teamNumber": competingTeams[10],
            "autoCargoUpperHub": 3,
            "autoCargoLowerHub": 2,
            "taxi": true,
            "autoFouls": 2,
            "teleopCargoUpperHub": 10,
            "teleopCargoLowerHub": 2,
            "teleopFouls": 2,
            "climbTime": 29,
            "partnerOnBar": false,
            "robotSpeed": "Fast",
            "driverSkills": "Bad",
            "defenseQuality": "NA"
        ]
        
        return dict
    }
}

let fields = [
    "id",
    "matchNumber",
    "day",
    "alliance",
    "teamNumber",
    "autoCargoUpperHub",
    "autoCargoLowerHub",
    "taxi",
    "autoFouls",
    "teleopCargoUpperHub",
    "teleopCargoLowerHub",
    "teleopFouls",
    "climbTime",
    "partnerOnBar",
    "robotSpeed",
    "driverSkills",
    "defenseQuality"
]
