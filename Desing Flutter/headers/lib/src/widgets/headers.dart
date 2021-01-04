import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
        color: Color(0xff615AAB),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
        //color: Color(0xff615AAB),     
        ),
        child: CustomPaint(
          painter: _HeaderDiagonalPainter(),
        ),
      );
  }
}


class _HeaderDiagonalPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      
      //? Lapiz con el que dibujar
      final paint = new Paint();

      //?Propiedades
      paint.color = Color(0xff615AAB);
      paint.style = PaintingStyle.fill;
      paint.strokeWidth = 5;

      final path = new Path();


      //?Dibujar con el path y el lapiz
      path.lineTo(0, size.height*0.40);
      path.lineTo(size.width,size.height*0.35);
      path.lineTo(size.width,0);
      path.lineTo(0,0);
      

      canvas.drawPath(path, paint);

    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    
    return true;
  }



}

class HeaderTriangular extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
        //color: Color(0xff615AAB),     
        ),
        child: CustomPaint(
          painter: _HeaderTriangularPainter(),
        ),
      );
  }
}


class _HeaderTriangularPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      
      //? Lapiz con el que dibujar
      final paint = new Paint();

      //?Propiedades
      paint.color = Color(0xff615AAB);
      paint.style = PaintingStyle.fill;
      paint.strokeWidth = 5;

      final path = new Path();


      //?Dibujar con el path y el lapiz
      path.lineTo(size.width, size.height);
      path.lineTo(size.width,0);
      
      

      canvas.drawPath(path, paint);

    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    
    return true;
  }



}