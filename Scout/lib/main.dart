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
        primarySwatch: Colors.blue,
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
  ScoutingSheet _scoutingSheet = ScoutingSheet();

  String _day = DayEnum.day1;

  String _robotSpeed = RobotSpeedEnum.slow;
  String _driverSkills = DriverSkillsEnums.bad;
  String _defense = DefenseQualityEnum.na;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              // MATCH INFO
              MatchInfoWidget(),
              // AUTONOMOUS
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Text("Autonomous", style: TextStyle(fontSize: 32)),
                ),
              ),
              const Counter("Auto Cargo Upper Hub"),
              const Counter("Auto Cargo Lower Hub"),
              const Counter("Auto Fouls"),
              const CheckButton("Taxi"),
              // TELEOP
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Text("Teleop", style: TextStyle(fontSize: 32)),
                ),
              ),
              Counter("Teleop Cargo Upper Hub"),
              Counter("Teleop Cargo Lower Hub"),
              Counter("Teleop Fouls"),
              // ENDGAME
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Endgame", style: TextStyle(fontSize: 32)),
                ),
              ),
              TimerButton("Climb Time"),
              CheckButton("Successful"),
              CheckButton("Partner on Bar"),
              // GENERAL
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("General", style: TextStyle(fontSize: 32)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Robot Speed"),
                  Container(
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
                  Text("Driver Skills"),
                  Container(
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
                  Text("Defense Quality"),
                  Container(
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
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.fromLTRB(10, 15, 10, 15),
                      ),
                    ),
                    onPressed: _incrementCounter,
                    child: Row(
                      children: [Icon(Icons.qr_code), Text("Generate QR Code")],
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
