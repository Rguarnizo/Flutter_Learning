import 'package:flutter/material.dart';
import 'package:headers/src/widgets/slideshow.dart';


class SlideshowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SlideShow(),
     ),
   );
  }
}