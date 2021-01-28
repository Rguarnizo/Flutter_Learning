import 'package:flutter/material.dart';
import 'package:headers/src/labs/slideshow_page.dart';



class LayoutModel with ChangeNotifier{

  Widget _currentPage = SlideShowPage();


  set currentPage(Widget page){
    this._currentPage = page;
    notifyListeners();
  }

  Widget get currentPage => this._currentPage;


}