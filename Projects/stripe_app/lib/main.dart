import 'package:flutter/material.dart';
import 'package:stripe_app/pages/check_pay_page.dart';
import 'package:stripe_app/pages/home_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stripe App',
      routes: {
        'home' : (_) => HomePage(),
        'checkPay': (_) => CheckPayPage(),
      },
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xff284879),
        scaffoldBackgroundColor: Color(0xff21232A)
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
    );
  }
}