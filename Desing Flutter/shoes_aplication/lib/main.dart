import 'package:flutter/material.dart';
import 'package:shoes_aplication/src/pages/shoe_desc_page.dart';
import 'package:shoes_aplication/src/pages/shoe_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoes App',
      routes: {
        'initPage': (_) => ShoePage(),
        'descPage': (_) => ShoeDescPage(),
      },
      home: ShoePage(),
    );
  }
}