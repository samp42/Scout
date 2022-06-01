//
//  ScoutingSheet.swift
//  Scout Insights
//
//  Created by Samuel Proulx on 2022-04-03.
//

import Foundation
import SwiftUI

struct ScoutingSheet {
    // sheet info
    let id: String

    // match info
    let matchNumber: Int
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
    let barReached: String
    let successful: Bool
    let partnerOnBar: Bool

    // general
    let robotSpeed: RobotSpeedEnum
    let driverSkills: DriverSkillsEnum
    let defenseQuality: DefenseQualityEnum

    public init(
            matchNumber: Int,
            teamNumber: Int,
            taxi: Bool,
            autoCargoUpperHub: Int,
            autoCargoLowerHub: Int,
            autoFouls: Int,
            teleopCargoUpperHub: Int,
            teleopCargoLowerHub: Int,
            teleopFouls: Int,
            climbTime: Int,
            barReached: String,
            successful: Bool,
            partnerOnBar: Bool,
            robotSpeed: RobotSpeedEnum,
            driverSkills: DriverSkillsEnum,
            defenseQuality: DefenseQualityEnum
    ) {
        self.id = UUID().uuidString

        self.matchNumber = matchNumber
        self.teamNumber = teamNumber

        self.taxi = taxi
        self.autoCargoUpperHub = autoCargoUpperHub
        self.autoCargoLowerHub = autoCargoLowerHub
        self.autoFouls = autoFouls

        self.teleopCargoUpperHub = teleopCargoUpperHub
        self.teleopCargoLowerHub = teleopCargoLowerHub
        self.teleopFouls = teleopFouls

        self.climbTime = climbTime
        self.barReached = barReached
        self.successful = successful
        self.partnerOnBar = partnerOnBar

        self.robotSpeed = robotSpeed
        self.driverSkills = driverSkills
        self.defenseQuality = defenseQuality
    }

    public init?(JSON: [String: Any]) throws {

        guard let matchNumberJSON = JSON["matchNumber"] as? String else {
            throw SerializationError.missing("matchNumber")
        }
        let matchNumber = Int(matchNumberJSON)

        guard let teamNumberJson = JSON["teamNumber"] as? String else {
            throw SerializationError.missing("teamNumber")
        }
        let teamNumber = Int(teamNumberJson)

        guard let taxiJson = JSON["taxi"] as? String else {
            throw SerializationError.missing("taxi")
        }
        let taxi = Bool(taxiJson)

        guard let autoCargoUpperHubJson = JSON["autoCargoUpperHub"] as? String else {
            throw SerializationError.missing("autoCargoUpperHub")
        }
        let autoCargoUpperHub = Int(autoCargoUpperHubJson)

        guard let autoCargoLowerHubJson = JSON["autoCargoLowerHub"] as? String else {
            throw SerializationError.missing("autoCargoLowerHub")
        }
        let autoCargoLowerHub = Int(autoCargoLowerHubJson)

        guard let autoFoulsJson = JSON["autoFouls"] as? String else {
            throw SerializationError.missing("autoFouls")
        }
        let autoFouls = Int(autoFoulsJson)

        guard let teleopCargoUpperHubJson = JSON["teleopCargoUpperHub"] as? String else {
            throw SerializationError.missing("teleopCargoUpperHub")
        }
        let teleopCargoUpperHub = Int(teleopCargoUpperHubJson)

        guard let teleopCargoLowerHubJson = JSON["teleopCargoLowerHub"] as? String else {
            throw SerializationError.missing("teleopCargoLowerHub")
        }
        let teleopCargoLowerHub = Int(teleopCargoLowerHubJson)

        guard let teleopFoulsJson = JSON["teleopFouls"] as? String else {
            throw SerializationError.missing("teleopFouls")
        }
        let teleopFouls = Int(teleopFoulsJson)

        guard let climbTimeJson = JSON["climbTime"] as? String else {
            throw SerializationError.missing("climbTime")
        }
        let climbTime = Int(climbTimeJson)

        guard let barReached = JSON["barReached"] as? String else {
            throw SerializationError.missing("barReached")
        }

        guard let successfulJson = JSON["successful"] as? String else {
            throw SerializationError.missing("successful")
        }
        let successful = Bool(successfulJson)

        guard let partnerOnBarJson = JSON["partnerOnBar"] as? String else {
            throw SerializationError.missing("partnerOnBar")
        }
        let partnerOnBar = Bool(partnerOnBarJson)

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

        self.id = UUID().uuidString

        self.matchNumber = matchNumber!
        self.teamNumber = teamNumber!

        self.autoCargoUpperHub = autoCargoUpperHub!
        self.autoCargoLowerHub = autoCargoLowerHub!
        self.taxi = taxi!
        self.autoFouls = autoFouls!

        self.teleopCargoUpperHub = teleopCargoUpperHub!
        self.teleopCargoLowerHub = teleopCargoLowerHub!
        self.teleopFouls = teleopFouls!

        self.climbTime = climbTime!
        self.barReached = barReached
        self.successful = successful!
        self.partnerOnBar = partnerOnBar!

        self.robotSpeed = robotSpeed!
        self.driverSkills = driverSkills!
        self.defenseQuality = defenseQuality!
    }

    public static func makeJsonMock() -> [String: Any] {
        let dict: [String: Any] = [
            "matchNumber": "4",
            "teamNumber": "3990",
            "autoCargoUpperHub": "3",
            "autoCargoLowerHub": "2",
            "taxi": "true",
            "autoFouls": "2",
            "teleopCargoUpperHub": "10",
            "teleopCargoLowerHub": "2",
            "teleopFouls": "2",
            "climbTime": "29",
            "barReached": "Mid",
            "partnerOnBar": "false",
            "robotSpeed": "Fast",
            "driverSkills": "Bad",
            "defenseQuality": "NA"
        ]

        return dict
    }

    public static func getMock() -> ScoutingSheet {
        let scoutingSheet = ScoutingSheet(matchNumber: 2, teamNumber: 3990, taxi: true, autoCargoUpperHub: 3, autoCargoLowerHub: 0, autoFouls: 1, teleopCargoUpperHub: 23, teleopCargoLowerHub: 2, teleopFouls: 2, climbTime: 19, barReached: "high", successful: true, partnerOnBar: false, robotSpeed: RobotSpeedEnum.FAST, driverSkills: DriverSkillsEnum.ACCEPTABLE, defenseQuality: DefenseQualityEnum.NA)

        return scoutingSheet
    }
}

