import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class MyProvider extends ChangeNotifier {
  String languageCode = "en"; //ar
  ThemeMode modeApp = ThemeMode.light;
  late SharedPreferences prefs ;

  changeLanguage(String langCode) async{
    languageCode = langCode;
    prefs=await SharedPreferences.getInstance();
    prefs.setString("lang", langCode);
    notifyListeners();
  }

  changeTheme(ThemeMode mode)async {
    modeApp = mode;
    prefs=await SharedPreferences.getInstance();
    prefs.setString("theme", mode==ThemeMode.light?"light":"dark");
    notifyListeners();
  }

  String changeBackground() {
    if (modeApp == ThemeMode.light) {
      return "assets/images/background.png";
    } else {
      return "assets/images/bg_dark.png";
    }
  }
}
