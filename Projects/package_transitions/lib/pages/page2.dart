import 'package:flutter/material.dart';


class Page2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text('Page 2'),),
      body: Center(
        child: Text('Hola Mundo'),
     ),
   );
  }
}