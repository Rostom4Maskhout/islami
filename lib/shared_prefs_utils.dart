



import 'package:shared_preferences/shared_preferences.dart';

void saveLastSuraIndex(int suraIndex)async{

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>  mostRecentList = prefs.getStringList('most_recent')?? [];
  if(mostRecentList.contains('$suraIndex')){
    mostRecentList.remove('$suraIndex');

  }
  mostRecentList.insert(0,'$suraIndex');

  if(mostRecentList.length > 5){
    mostRecentList.removeLast();
  }

  await prefs.setStringList('most_recent', mostRecentList);

}

Future<List<int>> getLastSuraList()async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>  mostRecentList = prefs.getStringList('most_recent')?? [];
   List<int> mostRecentInt = mostRecentList.map((e) => int.parse(e),).toList();
   print(mostRecentInt);
   return mostRecentInt;
}