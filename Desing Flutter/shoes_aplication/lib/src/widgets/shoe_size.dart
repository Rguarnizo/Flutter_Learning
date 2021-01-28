import 'package:flutter/material.dart';



class ShoePreview extends StatelessWidget {
  const ShoePreview({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
      child: Container(
        width: double.infinity,
        height: 350,
        decoration: BoxDecoration(
          color: Color(0xffFFCF53),
          borderRadius: BorderRadius.circular(50)
        ),
        child: Column(
          children: [
            //TODO: Zapato con sombra,
            _ShoeWithShadow()

            
            //TODO: Tallas de zapatos,


          ],
        ),
      ),
    );
  }
}


class _ShoeWithShadow extends StatelessWidget {
  const _ShoeWithShadow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(50),
      child: Stack(
        children: [
          Image(image: AssetImage('assets/imgs/azul.png'),)
        ],
      ),
    );
  }
}