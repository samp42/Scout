import 'dart:core';
import 'dart:convert';

import 'package:scout/models/AllianceEnum.dart';
import 'package:scout/models/CompetingTeams.dart';
import 'package:scout/models/DayEnum.dart';
import 'package:scout/models/DefenseQualityEnum.dart';
import 'package:scout/models/DriverSkillsEnum.dart';
import 'package:scout/models/RobotSpeedEnum.dart';

class ScoutingSheet {
  // sheet info
  String id = "null";

  // match info
  int matchNumber = 0;
  String day = DayEnum.day1;
  String alliance = AllianceEnum.blue;
  int teamNumber = CompetingTeams.day1Teams()[0];

  // auto
  int autoCargoUpperHub = 0;
  int autoCargoLowerHub = 0;
  int autoFouls = 0;

  // teleop
  int teleopCargoUpperHub = 0;
  int teleopCargoLowerHub = 0;
  int teleopFouls = 0;

  // endgame
  int climbTime = 0;
  bool successful = false;
  int tries = 0;
  bool partnerOnBar = false;

  // general
  String robotSpeed = RobotSpeedEnum.slow;
  String driverSkills = DriverSkillsEnums.bad;
  String defenseQuality = DefenseQualityEnum.na;

  String get toJSON => json.encode(this);
  void makeQRCode() {
    return;
  }
}