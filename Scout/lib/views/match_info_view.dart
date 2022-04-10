import 'package:flutter/material.dart';
import 'package:scout/models/AllianceEnum.dart';
import 'package:scout/models/CompetingTeams.dart';
import 'package:scout/models/DayEnum.dart';

class MatchInfoWidget extends StatefulWidget {
  final matchController;
  final teamController;

  const MatchInfoWidget(this.matchController, this.teamController, {Key? key}) : super(key: key);

  @override
  _MatchInfoWidgetState createState() => _MatchInfoWidgetState();
}

class _MatchInfoWidgetState extends State<MatchInfoWidget> {
  List _teams = CompetingTeams.competingTeams[0];
  int _teamNumber = CompetingTeams.day1Teams[0];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Text("Match Info", style: TextStyle(fontSize: 32)),
        ),
        TextField(
          controller: widget.matchController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Match Number',
          ),
        ),
        TextField(
          controller: widget.teamController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Team Number',
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text("Team Number"),
        //     Container(
        //       width: 200,
        //       child: DropdownButton<int>(
        //         value: _teamNumber,
        //         icon: const Icon(Icons.arrow_downward),
        //         elevation: 16,
        //         style: const TextStyle(color: Colors.black87),
        //         underline: Container(
        //           height: 2,
        //           color: Colors.black,
        //         ),
        //         onChanged: (int? newValue) {
        //           setState(() {
        //             _teamNumber = newValue!;
        //           });
        //         },
        //         items: _teams.map<DropdownMenuItem<int>>((var value) {
        //           return DropdownMenuItem<int>(
        //             value: value,
        //             child: Text("\(value)"),
        //           );
        //         }).toList()
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
