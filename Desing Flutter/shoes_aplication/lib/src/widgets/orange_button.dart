import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {

  final String text;
  final double scale;
  final Color color;

  const OrangeButton({
    Key key,
    this.text,
    this.scale = 1,
    this.color = Colors.orange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 150,      
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: color,
      ),
      child: Text('$text',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 16),),
    );
  }
}
