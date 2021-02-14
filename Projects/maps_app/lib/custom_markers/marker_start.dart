import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MarkerStart extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()..color = Colors.black;

    var radius = 20.0;
    var radiusWhite = 7.0;
        
    canvas.drawCircle(Offset(radius, size.height-radius),radius, paint);
    canvas.drawCircle(Offset(radius, size.height-radius),radiusWhite, paint..color= Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
