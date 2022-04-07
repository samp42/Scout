import 'package:flutter/material.dart';
import 'package:scout/models/GenericController.dart';

class Counter extends StatefulWidget {
  final String text;
  final GenericController controller;

  Counter(this.text, this.controller, {Key? key}) : super(key: key) {
    controller.value = 0;
  }

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
        widget.controller.value--;
      }
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      widget.controller.value++;
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
              child: const Icon(Icons.remove, color: Colors.red),
            ),
            Text("$_counter"),
            TextButton(
              onPressed: _incrementCounter,
              child: const Icon(Icons.add, color: Colors.green),
            ),
          ],
        )
      ],
    );
  }
}
