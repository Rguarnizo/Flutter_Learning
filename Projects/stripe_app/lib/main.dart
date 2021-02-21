import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stripe_app/bloc/Pay/pay_bloc.dart';
import 'package:stripe_app/pages/check_pay_page.dart';
import 'package:stripe_app/pages/home_page.dart';
import 'package:stripe_app/services/stripe_service.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {


  


  @override
  Widget build(BuildContext context) {

    StripeService().init();
    

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PayBloc(),),
      ],
      child: MaterialApp(
        title: 'StripeApp',
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
      ),
    );
  }
}