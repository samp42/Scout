import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  final String text;

  const Counter(this.text, {Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
              onPressed: _decrementCounter,
              child: const Icon(Icons.remove, color: Colors.redAccent),
            ),
            Text("$_counter"),
            TextButton(
              onPressed: _incrementCounter,
              child: const Icon(Icons.add, color: Colors.greenAccent),
            ),
          ],
        )
      ],
    );
  }
}
