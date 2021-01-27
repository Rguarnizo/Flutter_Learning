import 'dart:convert';

import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {

  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _currentTheme;


  ThemeChanger(int theme){
    switch(theme){
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(
          accentColor: Colors.pink,
        );
        break;
      case 2:
      _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;
      case 3:
      _darkTheme = false;
        _customTheme = true;
        _currentTheme = ThemeData.light();
        break;

      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(
          accentColor: Colors.pink,
        );

    }
  }

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
    if(value) _currentTheme = ThemeData.dark().copyWith(
      accentColor: Color(0xff48A0EB),
      primaryColorLight: Colors.white,
      scaffoldBackgroundColor: Color(0xff16202B),      
    );
    else      _currentTheme = ThemeData.light();
    notifyListeners();
  }



  @override
  String toString() => 'ThemeChanger(_darkTheme: $_darkTheme, _customTheme: $_customTheme, _currentTheme: $_currentTheme)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is ThemeChanger &&
      o._darkTheme == _darkTheme &&
      o._customTheme == _customTheme &&
      o._currentTheme == _currentTheme;
  }

  @override
  int get hashCode => _darkTheme.hashCode ^ _customTheme.hashCode ^ _currentTheme.hashCode;
}

