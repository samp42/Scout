import 'package:flutter/material.dart';

class TimerButton extends StatefulWidget {
  const TimerButton({Key? key}) : super(key: key);


  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<TimerButton> {
  double _timer = 0;
  bool _isCounting = false;

  void _startTimer() {
    setState(() {
      _isCounting = true;
    });
  }

  void _stopTimer() {
    setState(() {
      _isCounting = false;
    });
  }

  void _resetTimer() {
    setState(() {
      _isCounting = false;
      _timer = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Timer"),
        TextButton(onPressed: _resetTimer, child: const Icon(Icons.undo)),
        ElevatedButton(
          onPressed: () {
            _startTimer();
          },
          child: Text("start"),
        ),
      ],
    );
  }
}
