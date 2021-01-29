import 'package:flutter/material.dart';

import 'package:shoes_aplication/src/widgets/custom_widgets.dart';
import 'package:shoes_aplication/src/widgets/orange_button.dart';

class ShoeDescPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ShoePreview(fullScreen: true),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ShoeDescription(
                  titulo: 'Nike Air Max 720',
                  descripcion:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.\n \n El Nike Air Max 97 sigue pisando fuerte con los mismos detalles de diseño que lo hicieron famoso: líneas ondulantes, detalles reflectantes y amortiguación Max Air de largo completo.",
                ),
                AddCarButton(price: 180, scale: 0.5),
                _Colors()
              ],
            ),
          ),
        )
      ],
    ));
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
              _CircleButton(color: Color(0xffC6F646)),
              Positioned(left: 20,child: _CircleButton(color: Color(0xff364D56))),
              Positioned(left: 40,child: _CircleButton(color: Color(0xffFFAD29))),
              Positioned(left: 60,child: _CircleButton(color: Color(0xff2099F1))),
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

  const _CircleButton({
    Key key,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
