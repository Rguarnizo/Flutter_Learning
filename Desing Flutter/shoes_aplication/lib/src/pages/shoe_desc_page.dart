import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:shoes_aplication/src/widgets/custom_widgets.dart';
import 'package:shoes_aplication/src/widgets/orange_button.dart';

class ShoeDescPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Hero(tag: 'shoe',child: ShoePreview(fullScreen: true),),
            _BackButton()
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ShoeDescription(
                  titulo: 'Nike Air Max 720',
                  descripcion:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.\n \n El Nike Air Max 97 sigue pisando fuerte con los mismos detalles de diseño que lo hicieron famoso: líneas ondulantes, detalles reflectantes y amortiguación Max Air de largo completo.",
                ),
                Bounce(child: AddCarButton(price: 180, scale: 0.5),from: 10,),
                _Colors(),
                _ActionsButtons()
              ],
            ),
          ),
        )
      ],
    ));
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      child: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: Icon(
          Icons.chevron_left,
          color: Colors.white,
          size: 45,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}

class _ActionsButtons extends StatelessWidget {
  const _ActionsButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ActionButton(
            icon: Icons.favorite,
            iconColor: Colors.red,
          ),
          _ActionButton(icon: Icons.ac_unit),
          _ActionButton(icon: Icons.phone),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;

  const _ActionButton({
    Key key,
    @required this.icon,
    this.iconColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black12)],
          shape: BoxShape.circle),
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}

class _Colors extends StatelessWidget {
  const _Colors({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
              child: Stack(
            children: [

              _CircleButton(color: Color(0xff364D56),index: 0,),
              Positioned(
                  left: 30, child: _CircleButton(color: Color(0xff2099F1),index: 1,)),
              Positioned(
                  left: 60, child: _CircleButton(color: Color(0xffFFAD29),index: 2,)),
              Positioned(left: 90,child: _CircleButton(color: Color(0xffC6F646),index: 3,)),
            ],
          )),
          OrangeButton(
              scale: 0.7,
              text: 'More item related',
              color: Colors.orange.withOpacity(0.6)),
        ],
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final Color color;
  final int index;

  const _CircleButton({
    Key key,
    @required this.color,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: this.index*100),
      duration: Duration(milliseconds: 400),
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
