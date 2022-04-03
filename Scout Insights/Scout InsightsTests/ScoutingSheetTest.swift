//
//  ScoutingSheetTest.swift
//  Scout InsightsTests
//
//  Created by Samuel Proulx on 2022-04-03.
//

import XCTest
@testable import Scout_Insights

class ScoutingSheetTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testJsonConstructor() throws {
        let expected = ScoutingSheet.makeJsonMock()
        let actual = try ScoutingSheet(JSON: ScoutingSheet.makeJsonMock())
        
        // expected actual
        XCTAssertTrue((expected["matchNumber"] as! UInt) == actual?.matchNumber)
        XCTAssert((expected["day"] as! DayEnum) == actual?.day)
        XCTAssert((expected["alliance"] as! AllianceEnum) == actual?.alliance)
        XCTAssert((expected["teamNumber"] as! UInt) == actual?.teamNumber)
        XCTAssert((expected["taxi"] as! Bool) == actual?.taxi)
        XCTAssert((expected["autoCargoUpperHub"] as! UInt) == actual?.autoCargoUpperHub)
        XCTAssert((expected["autoCargoLowerHub"] as! UInt) == actual?.autoCargoLowerHub)
        XCTAssert((expected["autoFouls"] as! UInt) == actual?.autoFouls)
        XCTAssert((expected["autoTechFouls"] as! UInt) == actual?.autoTechFouls)
        XCTAssert((expected["teleopCargoUpperHub"] as! UInt) == actual?.teleopCargoUpperHub)
        XCTAssert((expected["teleopCargoLowerHub"] as! UInt) == actual?.teleopCargoLowerHub)
        XCTAssert((expected["teleopFouls"] as! UInt) == actual?.teleopFouls)
        XCTAssert((expected["teleopTechFouls"] as! UInt) == actual?.teleopTechFouls)
        XCTAssert((expected["climbTime"] as! UInt) == actual?.climbTime)
        XCTAssert((expected["partnerOnBar"] as! Bool) == actual?.partnerOnBar)
        XCTAssert((expected["RobotSpeed"] as! RobotSpeedEnum) == actual?.robotSpeed)
        XCTAssert((expected["driverSkills"] as! DriverSkillsEnum) == actual?.driverSkills)
        XCTAssert((expected["defenseQuality"] as! DefenseQualityEnum) == actual?.defenseQuality)
    }
}
