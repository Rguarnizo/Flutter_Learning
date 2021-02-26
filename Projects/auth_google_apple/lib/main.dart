import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AuthApp',
      home: Scaffold(
          appBar: AppBar(
            title: Text('AuthApp-Google-Apple'),
            actions: [
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.doorOpen,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: Container(
            child: Center(
              child: Column(
                children: [
                  MaterialButton(
                    onPressed: () {},
                    splashColor: Colors.transparent,
                    minWidth: double.infinity,
                    height: 40,
                    color: Colors.red,
                    shape: RoundedRectangleBorder(),
                    child: Row(
                      children: [
                        Icon(FontAwesomeIcons.google,color: Colors.white,),
                        Text('SingIn With Google',style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
