import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_aplication/src/models/shoe_model.dart';
import 'package:shoes_aplication/src/pages/shoe_desc_page.dart';
import 'package:shoes_aplication/src/pages/shoe_page.dart';
import 'package:flutter/services.dart' as services;
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ShoeModel())
      ],
      child: Builder(
        builder: (context) {

          services.SystemChrome.setSystemUIOverlayStyle(services.SystemUiOverlayStyle(statusBarColor: Colors.transparent));

          return MaterialApp(
              debugShowCheckedModeBanner: false,
              
              title: 'Shoes App',
              routes: {
                'initPage': (_) => ShoePage(),
                'descPage': (_) => ShoeDescPage(),
              },
              home: ShoePage(),
            );
        },
      ),
    );
  }
}