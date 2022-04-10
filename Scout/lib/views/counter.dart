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

  void reset() {
    _CounterState().counter = 0;
    controller.value = 0;
  }
}

class _CounterState extends State<Counter> {
  int counter = 0;

  void _decrementCounter() {
    setState(() {
      if (counter > 0) {
        counter--;
        widget.controller.value = counter;
      }

      if(counter <= 0) {
        counter = 0;
        widget.controller.value = counter;
      }
    });
  }

  void _incrementCounter() {
    setState(() {
      counter++;
      widget.controller.value = counter;
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
            Text("$counter"),
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
