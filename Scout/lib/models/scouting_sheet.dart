import 'dart:core';

import 'package:scout/models/AllianceEnum.dart';
import 'package:scout/models/CompetingTeams.dart';
import 'package:scout/models/DayEnum.dart';
import 'package:scout/models/DefenseQualityEnum.dart';
import 'package:scout/models/DriverSkillsEnum.dart';
import 'package:scout/models/RobotSpeedEnum.dart';

class ScoutingSheet {
  // match info
  String matchNumber = '0';
  String teamNumber = CompetingTeams.day1Teams[0].toString();

  // auto
  int autoCargoUpperHub = 0;
  int autoCargoLowerHub = 0;
  int autoFouls = 0;
  bool taxi = false;

  // teleop
  int teleopCargoUpperHub = 0;
  int teleopCargoLowerHub = 0;
  int teleopFouls = 0;

  // endgame
  String barReached = 'None';
  int climbTime = 0;
  bool successful = false;
  bool partnerOnBar = false;

  // general
  String robotSpeed = RobotSpeedEnum.slow;
  String driverSkills = DriverSkillsEnums.bad;
  String defenseQuality = DefenseQualityEnum.na;

  Map<String, dynamic> toJson() => {
    'matchNumber': matchNumber,
    'teamNumber': teamNumber,
    'autoCargoUpperHub': autoCargoUpperHub,
    'autoCargoLowerHub': autoCargoLowerHub,
    'autoFouls': autoFouls,
    'taxi': taxi,
    'teleopCargoUpperHub': teleopCargoUpperHub,
    'teleopCargoLowerHub': teleopCargoLowerHub,
    'teleopFouls': teleopFouls,
    'barReached': barReached,
    'climbTime': climbTime,
    'successful': successful,
    'partnerOnBar': partnerOnBar,
    'robotSpeed': robotSpeed,
    'driverSkills': driverSkills,
    'defenseQuality': defenseQuality
  };
}
