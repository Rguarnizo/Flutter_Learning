import 'package:flutter/material.dart';


class ThemeChanger with ChangeNotifier{

  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme;

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  set darkTheme(bool value){
    _customTheme = false;
    _darkTheme = value;

    if(value) _currentTheme = ThemeData.dark();
    else      _currentTheme = ThemeData.light();
    notifyListeners();
  }

  set customTheme(bool value){
    _customTheme = value;
    _darkTheme = false;
    if(value) _currentTheme = ThemeData.light();
    else      _currentTheme = ThemeData.light();
    notifyListeners();
  }

  


}

