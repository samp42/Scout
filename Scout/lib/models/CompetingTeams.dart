class CompetingTeams {
  static List day1Teams() {
    List list = new List.filled(17, null, growable: false);
    list.add(2626);
    list.add(3360);
    list.add(3533);
    list.add(3985);
    list.add(3990);
    list.add(4594);
    list.add(4955);
    list.add(5440);
    list.add(5528);
    list.add(5865);
    list.add(6872);
    list.add(6929);
    list.add(7605);
    list.add(8132);
    list.add(8152);
    list.add(8224);
    return list;
  }

  static List day2Teams() {
    List list = new List.filled(17, null, growable: false);
    list.add(296);
    list.add(3379);
    list.add(3386);
    list.add(3550);
    list.add(3986);
    list.add(3990);
    list.add(4952);
    list.add(5439);
    list.add(5443);
    list.add(5528);
    list.add(5570);
    list.add(6622);
    list.add(6869);
    list.add(7590);
    list.add(7605);
    list.add(7700);
    return list;
  }

  static List day3Teams() {
    List list = new List.filled(17, null, growable: false);
    list.add(296);
    list.add(3117);
    list.add(3360);
    list.add(3386);
    list.add(3544);
    list.add(3550);
    list.add(3975);
    list.add(3986);
    list.add(3990);
    list.add(3996);
    list.add(4947);
    list.add(4957);
    list.add(5439);
    list.add(5618);
    list.add(6540);
    list.add(7471);
    list.add(8067);
    return list;
  }

  static List competingTeams() {
    List list = new List.filled(3, null, growable: false);
    list.add(day1Teams());
    list.add(day2Teams());
    list.add(day3Teams());
    return list;
  }
}
