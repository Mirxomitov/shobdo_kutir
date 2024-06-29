import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  static late final SharedPreferences _pref;

  static init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static const String _isLoggedIn = 'isLoggedIn';

  static const String _searchHistory = 'searchHistory';

  static bool getIsLoggedIn() {
    return _pref.getBool(_isLoggedIn) ?? false;
  }

  static void setIsLoggedIn(bool value) {
    _pref.setBool(_isLoggedIn, value);
  }

  static void saveLoggedUser(String email) {
    // TODO not implemented
  }

  static void getLoggedUser() {}

  static Future<void> saveSearchHistory(String search) async {
    final searchHistory = getSearchHistory();
    searchHistory.add(search);
    await _pref.setStringList(_searchHistory, searchHistory);
  }

  static List<String> getSearchHistory() {
    return _pref.getStringList(_searchHistory) ?? [];
  }
}
