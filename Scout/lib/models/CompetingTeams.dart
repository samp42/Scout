import 'dart:ffi';

class CompetingTeams {
  // static List day1Teams() {
  //   List list = new List.filled(16, null, growable: false);
  //   list.add(2626);
  //   list.add(3360);
  //   list.add(3533);
  //   list.add(3985);
  //   list.add(3990);
  //   list.add(4594);
  //   list.add(4955);
  //   list.add(5440);
  //   list.add(5528);
  //   list.add(5865);
  //   list.add(6872);
  //   list.add(6929);
  //   list.add(7605);
  //   list.add(8132);
  //   list.add(8152);
  //   list.add(8224);
  //   return list;
  //}

  static var day1Teams = <int>[
    2626,
    3360,
    3533,
    3985,
    3990,
    4594,
    5440,
    5528,
    6872,
    6929,
    7605,
    8132,
    8152,
    8224
  ];

  // static List day2Teams() {
  //   List list = new List.filled(16, null, growable: false);
  //   list.add(296);
  //   list.add(3379);
  //   list.add(3386);
  //   list.add(3550);
  //   list.add(3986);
  //   list.add(3990);
  //   list.add(4952);
  //   list.add(5439);
  //   list.add(5443);
  //   list.add(5528);
  //   list.add(5570);
  //   list.add(6622);
  //   list.add(6869);
  //   list.add(7590);
  //   list.add(7605);
  //   list.add(7700);
  //   return list;
  // }

  static var day2Teams = <int>[
    296,
    3379,
    3386,
    3550,
    3986,
    3990,
    4952,
    5439,
    5443,
    5528,
    5570,
    6622,
    6869,
    7590,
    7605,
    7700
  ];

  // static List day3Teams() {
  //   List list = new List.filled(17, null, growable: false);
  //   list.add(296);
  //   list.add(3117);
  //   list.add(3360);
  //   list.add(3386);
  //   list.add(3544);
  //   list.add(3550);
  //   list.add(3975);
  //   list.add(3986);
  //   list.add(3990);
  //   list.add(3996);
  //   list.add(4947);
  //   list.add(4957);
  //   list.add(5439);
  //   list.add(5618);
  //   list.add(6540);
  //   list.add(7471);
  //   list.add(8067);
  //   return list;
  // }

  static var day3Teams = <int>[
    296,
    3117,
    3360,
    3386,
    3544,
    3550,
    3975,
    3986,
    3990,
    3996,
    4947,
    5439,
    5618,
    6540,
    7471,
    8067
  ];


  // static List competingTeams() {
  //   List list = new List.filled(3, null, growable: false);
  //   list.add(day1Teams);
  //   list.add(day2Teams);
  //   list.add(day3Teams);
  //   return list;
  // }

  static var competingTeams = [
    day1Teams,
    day2Teams,
    day3Teams
  ];
}
