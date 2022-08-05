import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rps/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSettingData with ChangeNotifier {
  static SharedPreferences? mySharedPref;
  bool _isGreen = true;

  void switchTheme(bool appTheme) {
    _isGreen = appTheme;
    saveSharedPreference(appTheme);
    notifyListeners();
  }

  ThemeData get selectedData => isGreen ? blueTheme : redTheme;
  bool get isGreen => _isGreen;

  Future<void> createSharedPreference() async {
    mySharedPref = await SharedPreferences.getInstance();
  }

  void saveSharedPreference(bool value) {
    mySharedPref?.setBool('themeData', value);
  }

  void loadSharedPreferences() {
    _isGreen = mySharedPref?.getBool('themeData') ?? true;
  }
}
