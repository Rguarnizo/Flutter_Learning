import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:headers/src/pages/animaciones_page.dart';
import 'package:headers/src/pages/graficas_circulares_page.dart';
import 'package:headers/src/pages/pinterest_page.dart';
import 'package:headers/src/pages/slider_list_page.dart';
import '../pages/slideshow_page.dart';
import '../pages/emergency_page.dart';
import '../pages/headers_page.dart';

final pageRoutes = <_Route>[

  _Route(FontAwesomeIcons.slideshare,'Slideshow',SlideshowPage()),
  _Route(FontAwesomeIcons.ambulance,'Emergencia',EmergencyPage()),
  _Route(FontAwesomeIcons.heading,'Encabezados',HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarry,'Cuadro Animado',AnimacionesPage()),
  _Route(FontAwesomeIcons.circleNotch,'Barra circular Page',GraficasCircularesPage()),
  _Route(FontAwesomeIcons.pinterest,'Pinterest',PinterestPage()),
  _Route(FontAwesomeIcons.mobile,'Slivers',SliderPage()),



];



class _Route{


  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);



}