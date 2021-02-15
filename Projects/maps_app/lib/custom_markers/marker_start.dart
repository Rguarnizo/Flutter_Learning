
part of 'custom_markers.dart';

class MarkerStart extends CustomPainter {

  final double min;

  MarkerStart(this.min);



  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()..color = Colors.black;

    var radius = 20.0;
    var radiusWhite = 7.0;
        
    canvas.drawCircle(Offset(radius, size.height-radius),radius, paint);
    canvas.drawCircle(Offset(radius, size.height-radius),radiusWhite, paint..color= Colors.white);

    final Path path = new Path();
    path.moveTo(40, 20);
    path.lineTo(size.width-10, 20);
    path.lineTo(size.width-10, 100);
    path.lineTo(40, 100);

    canvas.drawShadow(path, Colors.black87,10, false);

    //Caja blanca
    final whiteBox = Rect.fromLTWH(40, 20, size.width-60, 80);
    canvas.drawRect(whiteBox, paint);
    
    final blackBox = Rect.fromLTWH(40, 20, 70, 80);
    canvas.drawRect(blackBox, paint..color = Colors.black);

    final time = min.toStringAsFixed(1);
    //Dibujar Textos
    TextSpan textSpan = new TextSpan(
      text: '$time',
      style: TextStyle(color: Colors.white,fontSize:30,fontWeight: FontWeight.w400)
    );

    final textPainter = new TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center
    )..layout(maxWidth: 70,minWidth: 70);

    textPainter.paint(canvas, Offset(40,35));

      textSpan = new TextSpan(
      text: 'min',
      style: TextStyle(color: Colors.white,fontSize:25,fontWeight: FontWeight.w400)
    );

    final textPainterT = new TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center
    )..layout(maxWidth: 70,minWidth: 70);

    textPainterT.paint(canvas, Offset(40,65));

    textSpan = new TextSpan(
      text: 'Mi ubicación',
      style: TextStyle(color: Colors.black,fontSize:22,fontWeight: FontWeight.w400)
    );

    final textPainterUb = new TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center
    )..layout(maxWidth: size.width-130,minWidth: 70);

    textPainterUb.paint(canvas, Offset(150,50));



  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
