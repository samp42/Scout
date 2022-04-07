import 'package:flutter/material.dart';
import 'package:scout/models/AllianceEnum.dart';
import 'package:scout/models/CompetingTeams.dart';
import 'package:scout/models/DayEnum.dart';

class MatchInfoWidget extends StatefulWidget {
  final dayController;
  final matchController;
  final allianceController;
  final teamController;

  const MatchInfoWidget(this.dayController, this.matchController, this.allianceController, this.teamController, {Key? key}) : super(key: key);

  @override
  _MatchInfoWidgetState createState() => _MatchInfoWidgetState();
}

class _MatchInfoWidgetState extends State<MatchInfoWidget> {
  String _day = DayEnum.day1;
  int _matchNumber = 0;
  String _alliance = AllianceEnum.blue;
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Day"),
            SizedBox(
              width: 200,
              child: DropdownButton<String>(
                value: _day,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.black87),
                underline: Container(
                  height: 2,
                  color: Colors.black,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _day = newValue!;
                    widget.dayController.value = _day;
                  });
                },
                items: <String>['Day 1', 'Day 2', 'Day 3']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        TextField(
          controller: widget.matchController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Match Number',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Alliance"),
            SizedBox(
              width: 200,
              child: DropdownButton<String>(
                value: _alliance,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.black87),
                underline: Container(
                  height: 2,
                  color: Colors.black,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _alliance = newValue!;
                    widget.allianceController.value = _alliance;
                  });
                },
                items: <String>['Blue', 'Red']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
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
