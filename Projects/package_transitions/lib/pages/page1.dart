import 'package:flutter/material.dart';


class Page1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Page 1'),),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: MaterialButton(
          onPressed: () 
          => 
          Navigator.pushNamed(context, 'page2'),
          child: Text(
            'Go to page 2',
          ),
          color: Colors.white,
        ),
     ),
   );
  }
}