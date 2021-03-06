import 'package:flutter/material.dart';
import 'package:shoes_aplication/src/helpers/helpers.dart';
import 'package:shoes_aplication/src/widgets/custom_widgets.dart';
import 'package:shoes_aplication/src/widgets/shoe_description.dart';

class ShoePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    cambiarStatusDark();

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'For you',
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Hero(tag: 'shoe',child: ShoePreview()),
                  ShoeDescription(
                    titulo: 'Nike Air Max 720',
                    descripcion:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.\n \n El Nike Air Max 97 sigue pisando fuerte con los mismos detalles de diseño que lo hicieron famoso: líneas ondulantes, detalles reflectantes y amortiguación Max Air de largo completo.",
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            child: AddCarButton(price: 150),
            onTap: () => Navigator.pushNamed(context,'descPage'),
          ),
        ],
      ),
    );
  }
}
