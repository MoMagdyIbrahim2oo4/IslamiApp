import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const String mostRecentKey = 'MostRecnt';
  static const String seenKey = 'Seen';

  static Future<void> saveMostRecent(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecent = prefs.getStringList(mostRecentKey) ?? [];
    if (mostRecent.length > 5) {
      mostRecent = mostRecent.take(5).toList();
    }
    if (mostRecent.contains(index.toString())) {
      mostRecent.remove(index.toString());
    }
    mostRecent.insert(0, index.toString());
    prefs.setStringList(mostRecentKey, mostRecent);
  }

  static Future<List<int>> getMostRecent() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentAsString = prefs.getStringList(mostRecentKey) ?? [];
    List<int> mostRecentAsInt = mostRecentAsString
        .map((element) => int.parse(element))
        .toList();
    return mostRecentAsInt.toList();
  }

  static Future<void> setSeen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(seenKey, true);
  }

  static Future<bool> getSeen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(seenKey) ?? false;
  }
}