import 'package:flutter/material.dart';
import 'package:shoes_aplication/src/widgets/custom_widgets.dart';

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
                AddCarButton(price: 180,scale:0.5)
              ],
            ),
            
          ),
        )
      ],
    ));
  }
}
