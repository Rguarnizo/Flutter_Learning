import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({Key key}) : super(key: key);

  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> {
  double porcentaje = 10;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          porcentaje += 10;
          if(porcentaje > 100){
            porcentaje = 0;
          }
          setState(() {
            
          });
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
