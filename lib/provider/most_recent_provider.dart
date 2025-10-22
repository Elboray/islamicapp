import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/shared_pres_helper.dart';

class MostRecentProvider extends ChangeNotifier {
  //todo: data - function
  List<int> mostRecent = [];

  void readMostRecentList() async {
    final SharedPreferences pres = await SharedPreferences.getInstance();
    List<String> mostRecentAsString =
        pres.getStringList(SharedPresKeys.mostRecent) ?? [];

    mostRecent = mostRecentAsString
        .map((element) => int.parse(element))
        .toList()
        .reversed
        .toList();
    notifyListeners();
  }
}
