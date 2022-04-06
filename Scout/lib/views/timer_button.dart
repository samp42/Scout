import 'package:flutter/material.dart';

class TimerButton extends StatefulWidget {
  final String text;

  const TimerButton(this.text, {Key? key}) : super(key: key);

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<TimerButton> {
  final Stopwatch _stopwatch = Stopwatch();

  double _time = 0.0;
  bool _isCounting = false;
  bool _hasCounted = false;
  static const delta = Duration(milliseconds: 100);

  void _startTimer() {
    _isCounting = true;
    _hasCounted = false;
    _stopwatch.start();
  }

  void _stopTimer() {
    setState(() {
      _isCounting = false;
      _hasCounted = true;
      _time = (_stopwatch.elapsedMilliseconds / 1000);
      _stopwatch.stop();
    });
  }

  void _resetTimer() {
    setState(() {
      _isCounting = false;
      _hasCounted = false;
      _stopwatch.reset();
    });
  }

  void _count() {
    if(_stopwatch.isRunning) {
      print("${_stopwatch.elapsedMilliseconds}");
      _stopTimer();
      print("${_time}");
    } else {
      _startTimer();
    }
  }

  String _getText() {
    if(_hasCounted) {
      return _time.toString();
    }

    if(_isCounting) {
      print("TIME " + (_stopwatch.elapsedMilliseconds / 1000).toString());
      return (_stopwatch.elapsedMilliseconds / 1000).toString();
    }

    return "Start";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(widget.text),
            TextButton(onPressed: _resetTimer, child: const Icon(Icons.undo)),
            ElevatedButton(
              onPressed: () {
                _count();
              },
              child: Text(_getText()),
            ),
          ],
        ),
      ],
    );
  }
}
