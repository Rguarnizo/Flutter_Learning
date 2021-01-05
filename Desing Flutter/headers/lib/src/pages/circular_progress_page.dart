import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({Key key}) : super(key: key);

  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin{


  AnimationController controller;

  double porcentaje = 0.0;
  double nuevoporcentaje = 0.0;

  @override
  void initState() {
    super.initState();

    //! Init controller
    controller = new AnimationController(vsync: this,duration: Duration(milliseconds: 800));

    controller.addListener((){

      //print('valor controller: ${controller.value}');
      
      setState(() {
        porcentaje = lerpDouble(porcentaje, nuevoporcentaje,controller.value);
      });

    });


  }


  @override
  void dispose() {    
    super.dispose();
    controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          porcentaje = nuevoporcentaje;
          nuevoporcentaje += 10;
          if(porcentaje > 100){
            porcentaje = 0;
            nuevoporcentaje = 0;
          }
          setState(() {
            
          }        
          );
          controller.forward(from: 0.0);          
        },
      ),
      body: Center(
          child: Container(
        width: 300,
        height: 300,
        child: CustomPaint(
          painter: _MiRadialProgress(porcentaje),
        ),
      )),
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  double porcentaje;

  _MiRadialProgress(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {
    //?Circulo Completado
    final paint = new Paint()
      ..strokeWidth = 5
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    Offset center = new Offset(size.height * 0.5, size.width * 0.5);
    double radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    //? Arco
    final paintArco = new Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    //? Porcentage Arco
    double arcAngle = 2 * pi * (porcentaje / 100);

    //? Primer argumento es el Rect, el segundo es donde comenzará a dibujar, el punto final del dibujo.
    canvas.drawArc(Rect.fromCircle(center: center, radius: radio),-pi/2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
