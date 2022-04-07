import 'package:flutter/material.dart';
import 'package:scout/models/AllianceEnum.dart';
import 'package:scout/models/CompetingTeams.dart';
import 'package:scout/models/DayEnum.dart';

class MatchInfoWidget extends StatefulWidget {
  const MatchInfoWidget({Key? key}) : super(key: key);

  @override
  _MatchInfoWidgetState createState() => _MatchInfoWidgetState();
}

class _MatchInfoWidgetState extends State<MatchInfoWidget> {
  String _day = DayEnum.day1;
  int _matchNumber = 0;
  String _alliance = AllianceEnum.blue;
  List _teams = CompetingTeams.competingTeams()[0];
  int _teamNumber = CompetingTeams.day1Teams()[0];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text("Match Info", style: TextStyle(fontSize: 32)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Day"),
            Container(
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
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Match Number',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Alliance"),
            Container(
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
          obscureText: true,
          decoration: InputDecoration(
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
