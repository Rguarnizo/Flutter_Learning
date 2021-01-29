import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {

  final String text;

  const OrangeButton({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 150,      
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.orange
      ),
      child: Text('$text',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
    );
  }
}
