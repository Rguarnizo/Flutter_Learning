import 'package:band_names/sevices/socket_service.dart';
import 'package:flutter/material.dart';

import 'package:band_names/pages/home.dart';
import 'package:band_names/pages/status.dart';
import 'package:provider/provider.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SocketService(),),
      ],
        child: MaterialApp(
        title: 'Material App',
        initialRoute: 'status',
        routes: {
          'home': (_) => HomePage(),
          'status': (_) => StatusPage(),
        },
        
      ),
    );
  }
}