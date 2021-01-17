import 'package:flutter/material.dart';


class SliderModel with ChangeNotifier{

  double _currentPage = 0;
  Color colorPrimario;

  double get currentPage => this._currentPage;
  
  set currentPage(double currentPage){
    this._currentPage = currentPage;
    notifyListeners();
  }



}