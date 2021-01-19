import 'package:chat_app/routes/routes.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => SocketService()),
        
      ],
      child: MaterialApp(
        title: 'Char App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'JosefinSans'),
        initialRoute: 'loading',
        routes: appRoutes,
      ),
    );
  }
}