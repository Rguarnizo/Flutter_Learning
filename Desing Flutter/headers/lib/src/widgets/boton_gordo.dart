import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {


  final IconData icon;
  final String text;
  final Color primaryColor;
  final Color secondaryColor;
  final Function onPress;


  const BotonGordo({
    Key key,
    this.icon           = FontAwesomeIcons.circle,
    @required this.text,
    this.primaryColor   = Colors.grey,
    this.secondaryColor = Colors.blueGrey,
    @required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        _botonGordoBackground(onPress: onPress,primaryColor: primaryColor,secundaryColor: secondaryColor),
        _buttonDecoration(text: text,icon: icon,),
      ]),
    );
  }
}

class _botonGordoBackground extends StatelessWidget {

  final Function onPress;
  final Color primaryColor;
  final Color secundaryColor;


  const _botonGordoBackground({
    Key key,
    this.onPress,
    this.primaryColor,
    this.secundaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPress,
        child: Container(
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
              primaryColor,
              secundaryColor,
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
      ),
    );
  }
}

class _buttonDecoration extends StatelessWidget {

  final String text;
  final IconData icon;


  const _buttonDecoration({
    Key key,
    this.text,
    this.icon,
  }) : super(key: key);

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
          icon,
          color: Colors.white,
          size: 40,
        )),
        SizedBox(
          width: 20,
        ),
        Expanded(
            child: Text(
            text,
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
