import 'package:flutter/material.dart';
import 'package:maps_app/pages/gps_access.dart';
import 'package:maps_app/pages/loading_page.dart';
import 'package:maps_app/pages/map_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: GpsAccessPage(),
      routes: {
        'map': (_) => MapPage(),
        'gps':(_)=> GpsAccessPage(),
        'loading': (_) => LoadingPage(),
      },
    );
  }
}