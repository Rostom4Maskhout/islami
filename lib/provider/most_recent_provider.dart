

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentProvider extends ChangeNotifier {

  List<int> mostRecentList = [];

  void getLastSuraList()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>  mostRecentSuraList = prefs.getStringList('most_recent')?? [];
    mostRecentList = mostRecentSuraList.map((e) => int.parse(e),).toList();

    notifyListeners();
  }

}

