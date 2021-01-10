import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  final Function callBackFunction;
  final String text;

  const BlueButton({
    Key key,
    @required this.callBackFunction,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: callBackFunction,
      elevation: 2,
      highlightElevation: 10,
      color: Colors.blue,
      shape: StadiumBorder(),
      child: Container(
        height: 45,
        width: double.infinity,
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        )),
      ),
    );
  }
}
