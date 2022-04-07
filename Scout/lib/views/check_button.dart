import 'package:flutter/material.dart';

class CheckButton extends StatefulWidget {
  final String text;

  const CheckButton(this.text, {Key? key}) : super(key: key);

  @override
  _CheckButtonState createState() => _CheckButtonState();
}

class _CheckButtonState extends State<CheckButton> {
  bool _selected = false;

  void _toggle(bool selection) {
    setState(() {
      _selected = selection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.text),
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 43, 0),
          child: Checkbox(
              value: _selected,
              onChanged: (bool? value) {
                setState(() {
                  _selected = value!;
                });
              }),
        )
      ],
    );
  }
}
