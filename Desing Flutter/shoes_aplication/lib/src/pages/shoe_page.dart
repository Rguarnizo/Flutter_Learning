import 'package:flutter/material.dart';
import 'package:shoes_aplication/src/widgets/custom_widgets.dart';



class ShoePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAppBar(title: 'For you',)
   );
  }
}