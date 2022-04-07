import 'package:scout/models/AllianceEnum.dart';
import 'package:scout/models/GenericController.dart';
import 'package:scout/views/qr_page.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:scout/models/DayEnum.dart';
import 'package:scout/models/DefenseQualityEnum.dart';
import 'package:scout/models/DriverSkillsEnum.dart';
import 'package:scout/models/RobotSpeedEnum.dart';
import 'package:scout/models/scouting_sheet.dart';
import 'package:scout/views/check_button.dart';
import 'package:scout/views/counter.dart';
import 'package:scout/views/match_info_view.dart';
import 'package:scout/views/timer_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tech Scout',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Tech Scout'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScoutingSheet _scoutingSheet = ScoutingSheet();

  String _robotSpeed = RobotSpeedEnum.slow;
  String _driverSkills = DriverSkillsEnums.bad;
  String _defense = DefenseQualityEnum.na;

  // match info
  // GenericController
  final dayController = GenericController(DayEnum.day1);
  final matchNumberController = TextEditingController();
  final allianceController = GenericController(AllianceEnum.blue);
  final teamNumberController = TextEditingController();

  // auto
  final autoCargoUpperHubController = GenericController(0);
  final autoCargoLowerHubController = GenericController(0);
  final autoFoulsController = GenericController(0);
  final taxiController = GenericController(false);

  // teleop
  final teleopCargoUpperHubController = GenericController(0);
  final teleopCargoLowerHubController = GenericController(0);
  final teleopFoulsController = GenericController(0);

  // endgame
  final climbTimeController = GenericController(0);
  final successfulClimbController = GenericController(false);
  final partnerOnBarController = GenericController(false);

  // general
  final robotSpeedController = GenericController(RobotSpeedEnum.slow);
  final driverSkillsController = GenericController(DriverSkillsEnums.bad);
  final defenseQualityController = GenericController(DefenseQualityEnum.na);

  void _generateQRCode() {
    setState(() {
      // id
      Uuid uuid = const Uuid();
      _scoutingSheet.id = uuid.v4();

      // match info
      _scoutingSheet.day = dayController.value;
      _scoutingSheet.matchNumber = matchNumberController.text;
      _scoutingSheet.alliance = allianceController.value;
      _scoutingSheet.teamNumber = teamNumberController.text;

      // auto
      _scoutingSheet.autoCargoUpperHub = autoCargoUpperHubController.value;
      _scoutingSheet.autoCargoLowerHub = autoCargoLowerHubController.value;
      _scoutingSheet.autoFouls = autoFoulsController.value;
      _scoutingSheet.taxi = taxiController.value;

      // teleop
      _scoutingSheet.teleopCargoUpperHub = teleopCargoUpperHubController.value;
      _scoutingSheet.teleopCargoLowerHub = teleopCargoLowerHubController.value;
      _scoutingSheet.teleopFouls = teleopFoulsController.value;

      // endgame
      _scoutingSheet.climbTime = climbTimeController.value;
      _scoutingSheet.successful = successfulClimbController.value;
      _scoutingSheet.partnerOnBar = partnerOnBarController.value;

      // general
      _scoutingSheet.robotSpeed = robotSpeedController.value;
      _scoutingSheet.driverSkills = driverSkillsController.value;
      _scoutingSheet.defenseQuality = defenseQualityController.value;
    });
  }

  // TODO: reset fields when done
  // void _resetFields() {
  //   setState(() {
  //     // match info
  //     // dayController.value;
  //     _scoutingSheet.matchNumber = matchNumberController.text;
  //     _scoutingSheet.alliance = allianceController.value;
  //     _scoutingSheet.teamNumber = teamNumberController.text;
  //
  //     // auto
  //
  //     _scoutingSheet.autoCargoUpperHub = autoCargoUpperHubController.value;
  //     _scoutingSheet.autoCargoLowerHub = autoCargoLowerHubController.value;
  //     _scoutingSheet.autoFouls = autoFoulsController.value;
  //     _scoutingSheet.taxi = taxiController.value;
  //
  //     // teleop
  //     _scoutingSheet.teleopCargoUpperHub = teleopCargoUpperHubController.value;
  //     _scoutingSheet.teleopCargoLowerHub = teleopCargoLowerHubController.value;
  //     _scoutingSheet.teleopFouls = teleopFoulsController.value;
  //
  //     // endgame
  //     _scoutingSheet.climbTime = climbTimeController.value;
  //     _scoutingSheet.successful = successfulClimbController.value;
  //     _scoutingSheet.partnerOnBar = partnerOnBarController.value;
  //
  //     // general
  //     _scoutingSheet.robotSpeed = robotSpeedController.value;
  //     _scoutingSheet.driverSkills = driverSkillsController.value;
  //     _scoutingSheet.defenseQuality = defenseQualityController.value;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(Icons.undo),
        //     onPressed: () {
        //       _resetFields();
        //     },
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              // MATCH INFO
              MatchInfoWidget(dayController, matchNumberController,
                  allianceController, teamNumberController),
              // AUTONOMOUS
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Text("Autonomous", style: TextStyle(fontSize: 32)),
                ),
              ),
              Counter("Auto Cargo Upper Hub", autoCargoUpperHubController),
              Counter("Auto Cargo Lower Hub", autoCargoLowerHubController),
              Counter("Auto Fouls", autoFoulsController),
              CheckButton("Taxi", taxiController),
              // TELEOP
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Text("Teleop", style: TextStyle(fontSize: 32)),
                ),
              ),
              Counter("Teleop Cargo Upper Hub", teleopCargoUpperHubController),
              Counter("Teleop Cargo Lower Hub", teleopCargoLowerHubController),
              Counter("Teleop Fouls", teleopFoulsController),
              // ENDGAME
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Text("Endgame", style: TextStyle(fontSize: 32)),
                ),
              ),
              TimerButton("Climb Time", climbTimeController),
              CheckButton("Successful", successfulClimbController),
              CheckButton("Partner on Bar", partnerOnBarController),
              // GENERAL
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Text("General", style: TextStyle(fontSize: 32)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Robot Speed"),
                  SizedBox(
                    width: 200,
                    child: DropdownButton<String>(
                      value: _robotSpeed,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black87),
                      underline: Container(
                        height: 2,
                        color: Colors.black,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _robotSpeed = newValue!;
                          robotSpeedController.value = _robotSpeed;
                        });
                      },
                      items: <String>['Slow', 'Medium', 'Fast']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Driver Skills"),
                  SizedBox(
                    width: 200,
                    child: DropdownButton<String>(
                      value: _driverSkills,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black87),
                      underline: Container(
                        height: 2,
                        color: Colors.black,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _driverSkills = newValue!;
                          driverSkillsController.value = _driverSkills;
                        });
                      },
                      items: <String>['Bad', 'Acceptable', 'Good']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Defense Quality"),
                  SizedBox(
                    width: 200,
                    child: DropdownButton<String>(
                      value: _defense,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black87),
                      underline: Container(
                        height: 2,
                        color: Colors.black,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _defense = newValue!;
                          defenseQualityController.value = _defense;
                        });
                      },
                      items: <String>['NA', 'Bad', 'Acceptable', 'Good']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.fromLTRB(10, 15, 10, 15),
                    ),
                  ),
                  onPressed: () => {
                    _generateQRCode(),
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QrPage(_scoutingSheet))),
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.qr_code),
                      Text("Generate QR Code")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
