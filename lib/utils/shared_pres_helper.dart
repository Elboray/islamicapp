import 'package:shared_preferences/shared_preferences.dart';

class SharedPresKeys {
  static const String mostRecent = "most_recent";
}

void saveLastSuraIndex(int newSuraIndex) async {
  final SharedPreferences pres = await SharedPreferences.getInstance();
  List<String> mostRecent = pres.getStringList(SharedPresKeys.mostRecent) ?? [];
  if (mostRecent.contains('$newSuraIndex')) {
    mostRecent.remove('$newSuraIndex');
    mostRecent.add('$newSuraIndex');
  } else {
    mostRecent.add('$newSuraIndex');
  }
  if (mostRecent.length > 5) {
    mostRecent.removeLast();
  }
  await pres.setStringList(SharedPresKeys.mostRecent, mostRecent);
}
