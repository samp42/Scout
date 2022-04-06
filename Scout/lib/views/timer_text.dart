import 'dart:async';
import 'package:flutter/cupertino.dart';

class TimerText extends StatefulWidget {
  TimerText({required this.stopwatch});

  final Stopwatch stopwatch;

  TimerTextState createState() => new TimerTextState(stopwatch: stopwatch);
}

class TimerTextState extends State<TimerText> {
  Timer timer;
  final Stopwatch stopwatch;

  TimerTextState({required this.stopwatch}) {
    timer = Timer.periodic(Duration(milliseconds: 1000), callback);
  }

  void callback(Timer timer) {
    if (stopwatch.isRunning) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle timerTextStyle =
        const TextStyle(fontSize: 60.0, fontFamily: "Open Sans");
    String formattedTime =
        TimerTextFormatter.format(stopwatch.elapsedMilliseconds);
    return new Text(formattedTime, style: timerTextStyle);
  }
}

class TimerTextFormatter {
  static String format(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();

    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');

    return "$secondsStr.$hundredsStr";
  }
}
