import 'package:flutter/material.dart';
import 'package:shoes_aplication/src/widgets/custom_widgets.dart';
import 'package:shoes_aplication/src/widgets/shoe_description.dart';



class ShoePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Column(
        children: [
          CustomAppBar(title: 'For you',),          
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  ShoePreview(),
                  ShoeDescription(
                    titulo: 'Nike Air Max 720',
                    descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                    ),
                  
                ],
              ),
            ),
          ),
        ],
      ),
      
   );
  }
}