import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*class UiProvider extends ChangeNotifier {
  //bool _isDark = false;
  //bool get isDark => _isDark;

  //Custom dark theme
  //final darkTheme = ThemeData(
  //primaryColor: Colors.black12,
  //brightness: Brightness.dark,
  //primaryColorDark: Colors.black12);

  //Custom light theme
  //final lightTheme = ThemeData(
  //primaryColor: Colors.white,
  //brightness: Brightness.light,
  //primaryColorDark: Colors.white);

  //Dark Mode toggle action
  //changeTheme() {
  //_isDark = !isDark;
  //notifyListeners();
  //}

  //init method of provider
  //init() {
  //notifyListeners();
  //}
//}
  bool _isDark = false;
  bool get isDark => _isDark;

  late SharedPreferences storage;

  //Custom dark theme
  final darkTheme = ThemeData(
    //primaryColor: Colors.black12,
    brightness: Brightness.dark,
    //primaryColorDark: Colors.black12,
  );

  //Custom light theme
  final lightTheme = ThemeData(
    //primaryColor: Colors.white,
    brightness: Brightness.light,
    //primaryColorDark: Colors.white
  );

  //Now we want to save the last changed theme value

  //Dark mode toggle action
  changeTheme() {
    _isDark = !isDark;

    //Save the value to secure storage
    storage.setBool("isDark", _isDark);
    notifyListeners();
  }

  //Init method of provider
  init() async {
    //After we re run the app
    storage = await SharedPreferences.getInstance();
    _isDark = storage.getBool("isDark") ?? false;
    notifyListeners();
  }
}*/

class UiProvider extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  late SharedPreferences storage;

  final darkTheme = ThemeData(
    brightness: Brightness.dark,
  );

  final lightTheme = ThemeData(
    brightness: Brightness.light,
  );

  changeTheme() {
    _isDark = !isDark;
    storage.setBool("isDark", _isDark);

    // Notify listeners about the theme change
    notifyListeners();
  }

  init() async {
    storage = await SharedPreferences.getInstance();
    _isDark = storage.getBool("isDark") ?? false;
    notifyListeners();
  }
}
