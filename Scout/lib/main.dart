import 'package:flutter/material.dart';
import 'package:scout/models/scouting_sheet.dart';
import 'package:scout/views/check_button.dart';
import 'package:scout/views/counter.dart';
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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  ScoutingSheet _scoutingSheet = ScoutingSheet();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // MATCH INFO
              Align(
                alignment: Alignment.topLeft,
                child: Text("Match Info", style: TextStyle(fontSize: 32)),
              ),
              // AUTONOMOUS
              Align(
                alignment: Alignment.topLeft,
                child: Text("Autonomous", style: TextStyle(fontSize: 32)),
              ),
              Counter("Auto Cargo Upper Hub"),
              Counter("Auto Cargo Lower Hub"),
              Counter("Auto Fouls"),
              CheckButton("Taxi"),
              // TELEOP
              Align(
                alignment: Alignment.topLeft,
                child: Text("Teleop", style: TextStyle(fontSize: 32)),
              ),
              Counter("Teleop Cargo Upper Hub"),
              Counter("Teleop Cargo Lower Hub"),
              Counter("Teleop Fouls"),
              // ENDGAME
              Align(
                alignment: Alignment.topLeft,
                child: Text("Endgame", style: TextStyle(fontSize: 32)),
              ),
              TimerButton("Climb Time"),
              CheckButton("Successful"),
              CheckButton("Partner on Bar"),
              // GENERAL
              Align(
                alignment: Alignment.topLeft,
                child: Text("General", style: TextStyle(fontSize: 32)),
              ),
              ElevatedButton(
                onPressed: _incrementCounter,
                child: Row(
                  children: [
                    Icon(Icons.qr_code),
                    Text("Generate QR Code")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
