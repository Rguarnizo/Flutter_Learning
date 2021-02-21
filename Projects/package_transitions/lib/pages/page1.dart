import 'package:flutter/material.dart';


class Page1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Page 1'),),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Text('Hola Mundo'),
     ),
   );
  }
}