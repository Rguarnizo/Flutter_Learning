import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {
  const BotonGordo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        _botonGordoBackground(),
        _buttonDecoration(),
      ]),
    );
  }
}

class _botonGordoBackground extends StatelessWidget {
  const _botonGordoBackground({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.red,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(4, 6),
                blurRadius: 10)
          ],
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [
            Color(0xff6989F5),
            Color(0xff906EF5),
          ])),
      width: double.infinity,
      height: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
          child: Stack(children: [
          Positioned(
            right: -20,
            top: -20,
              child: FaIcon(
            FontAwesomeIcons.carCrash,
            color: Colors.white.withOpacity(0.2),
            size: 150,
          )),
        ]),
      ),
    );
  }
}

class _buttonDecoration extends StatelessWidget {
  const _buttonDecoration({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 140,
          width: 30,
        ),
        Container(
            child: FaIcon(
          FontAwesomeIcons.carCrash,
          color: Colors.white,
          size: 40,
        )),
        SizedBox(
          width: 20,
        ),
        Expanded(
            child: Text(
            'Motor Accident',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
        SizedBox(width: 30),
      ],
    );
  }
}
