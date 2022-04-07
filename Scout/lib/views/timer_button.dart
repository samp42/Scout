import 'package:flutter/material.dart';

class TimerButton extends StatefulWidget {
  final String text;
  final controller;

  const TimerButton(this.text, this.controller, {Key? key}) : super(key: key);

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<TimerButton> {
  final Stopwatch _stopwatch = Stopwatch();

  double time = 0.0;
  bool _hasCounted = false;
  static const delta = Duration(milliseconds: 100);

  void _startTimer() {
    setState(() {
      _hasCounted = false;
      _stopwatch.start();
    });
  }

  void _stopTimer() {
    setState(() {
      _hasCounted = true;
      time = (_stopwatch.elapsedMilliseconds / 1000);
      _stopwatch.stop();
      widget.controller.value = time.round();
    });
  }

  void _resetTimer() {
    setState(() {
      _hasCounted = false;
      _stopwatch.reset();
    });
  }

  void _count() {
    if (_stopwatch.isRunning) {
      _stopTimer();
    } else {
      _startTimer();
    }
  }

  String _getText() {
    if (_hasCounted) {
      return time.toString();
    }

    if (_stopwatch.isRunning) {
      return "Stop";
    }

    return "Start";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.text),
        Row(
          children: [
            TextButton(
              onPressed: _resetTimer,
              child: const Text(
                "Reset",
              ),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _count();
              },
              child: Text(_getText()),
              style: ButtonStyle(
                  backgroundColor: _stopwatch.isRunning ? MaterialStateProperty.all(Colors.red) : MaterialStateProperty.all(Colors.green),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
