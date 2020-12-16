import 'dart:math';

import 'package:flutter/material.dart';



class AnimatedContainerPage extends StatefulWidget {
  AnimatedContainerPage({Key key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _width = 50.0;
  double _height= 50.0;
  Color _color = Colors.pink;

  BorderRadiusGeometry _borderRadius= BorderRadius.circular(8.0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Animated Container'),
       ),
       body: Center(
         child: AnimatedContainer(
           height: _height,
           width: _width,
           decoration: BoxDecoration(
             borderRadius: _borderRadius,
             color: _color,
           ), duration: Duration(milliseconds: 250),
           curve: Curves.decelerate,
           
         ),
       ),
       floatingActionButton: FloatingActionButton(onPressed: _cambiarForma,      
       child: Icon(Icons.track_changes),
       )
    );
  }

  void _cambiarForma() {

    final random = Random();

         setState(() {
           _width = random.nextInt(300).toDouble();
           _height = random.nextInt(300).toDouble();
           _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256),random.nextInt(256), 1);
           _borderRadius= new BorderRadius.circular(random.nextInt(50).toDouble());
         });
       
  }
}